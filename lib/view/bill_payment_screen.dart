import 'package:expense_tracker/view/bill_payment_receipt_screen.dart';
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
                          "Bill Payment", // Updated title
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          // Correct placement of the IconButton
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
            child: Container(
              // Removed ClipRRect for rounded corners of the card
              decoration: const BoxDecoration(
                // Added BoxDecoration for rounded corners
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        // Use a Column to center everything vertically
                        mainAxisSize:
                            MainAxisSize.min, // Important: Use min size
                        children: [
                          Image.asset(image,
                              height: 60), // Increased size a bit
                          const SizedBox(height: 16), // Added some space
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
                          Text(
                              '\$${price.toStringAsFixed(2) // Fixed decimal places
                              }'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fee'),
                          Text(
                              '\$${fee.toStringAsFixed(2) // Fixed decimal places
                              }'),
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
                          Text(
                              '\$${(price + fee).toStringAsFixed(2) // Fixed decimal places
                              }',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 240), // Increased spacing
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
                                      BillPaymentReceiptScreen(
                                        // Pass the title, price, and fee to the next screen
                                        title: title,
                                        price: price,
                                        fee: fee,
                                      )), // Navigate to BankLinkScreen
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF429690),
                            elevation: 10.0, // Set the elevation here
                            shadowColor: Colors.black,
                          ),
                          child: const Text('Confirm and Pay',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
