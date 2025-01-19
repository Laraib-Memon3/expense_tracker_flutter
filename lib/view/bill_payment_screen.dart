import 'package:expense_tracker/view/bill_payment_receipt_screen.dart';
import 'package:expense_tracker/view/widgets/reusable_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BillPaymentScreen extends StatelessWidget {
  final String title;
  final double price;
  final double fee;
  final String image;
  const BillPaymentScreen({
    super.key,
    required this.title,
    required this.price,
    required this.fee,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF429690),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF429690),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset(
                  'assets/images/overlapping_cirlces.svg',
                ),
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.only(top: 10),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text(
                          "Bill Payment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.more_horiz, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(image, height: 60),
                        const SizedBox(height: 16),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'You will pay  ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            children: [
                              TextSpan(
                                text: title,
                                style: const TextStyle(
                                  color: Color(0xff438883),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' for one month with BCA OneKlik',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price'),
                        Text('\$${price.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fee'),
                        Text('\$${fee.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('\$${(price + fee).toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Spacer(),
                  ReusableCircularButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BillPaymentReceiptScreen(
                                    title: title,
                                    price: price,
                                    fee: fee,
                                  )),
                        );
                      },
                      title: 'Confirm and Pay'),
                  SizedBox(
                    height: screenHeight * 0.05,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
