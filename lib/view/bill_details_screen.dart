import 'package:expense_tracker/view/bill_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BillDetailsScreen extends StatelessWidget {
  final String title;
  final double price;
  final double fee;
  final String date;
  final String image;

  const BillDetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.fee,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF429690),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF429690),
                ),
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
                          "Bill Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.more_horiz, color: Colors.white),
                          onPressed: () {
                            // Handle three-dot menu press here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset(
                  'assets/images/overlapping_cirlces.svg',
                ),
              ),
            ],
          ),
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24.0)),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Image.asset(image),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                date,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
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
                      const SizedBox(height: 34),
                      const Text("Select payment method",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card, color: Color(0xFF429690)),
                            const SizedBox(width: 16),
                            const Text("Debit Card",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Icon(Icons.radio_button_checked,
                                color: Color(0xFF429690)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.paypal, color: Colors.grey[400]),
                            const SizedBox(width: 16),
                            const Text("Paypal",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Icon(Icons.radio_button_unchecked,
                                color: Colors.grey[400]),
                          ],
                        ),
                      ),
                      const SizedBox(height: 150),
                      Center(
                        child: SizedBox(
                          width: 400.0,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BillPaymentScreen(
                                          title: title,
                                          price: price,
                                          fee: fee,
                                          image: image,
                                        )), // Navigate to BankLinkScreenima
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF429690),
                              elevation: 10.0, // Set the elevation here
                              shadowColor: Colors.black,
                            ),
                            child: const Text('Pay Now',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
