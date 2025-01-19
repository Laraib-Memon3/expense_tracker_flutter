import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class BillPaymentReceiptScreen extends StatelessWidget {
  final String title;
  final double price;
  final double fee;

  const BillPaymentReceiptScreen({
    super.key,
    required this.title,
    required this.price,
    required this.fee,
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
                          onPressed: () {

                          },
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0xffFAFAFA),
                            child: SvgPicture.asset(
                              'assets/images/icons/confirmation_tick.svg',
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Payment Successfully",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff438883),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff666666)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text("Transaction details",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment method',
                              style: const TextStyle(color: Colors.grey)),
                          Text('Debit Card'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status',
                              style: const TextStyle(color: Colors.grey)),
                          Text('Completed'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Time',
                              style: const TextStyle(color: Colors.grey)),
                          Text('08:15 AM'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date',
                              style: const TextStyle(color: Colors.grey)),
                          Text('Feb 28, 2022'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transaction ID',
                              style: const TextStyle(color: Colors.grey)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('2092913832472..'),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(const ClipboardData(
                                      text: '2092913832472..'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Transaction ID copied')),
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/images/icons/copy.svg',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price'),
                          Text(
                              '\$${price.toStringAsFixed(2) 
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
                              '-\$${fee.toStringAsFixed(2) 
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
                              '\$${(price + fee).toStringAsFixed(2) 
                              }',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: SizedBox(
                        width: 400.0,
                        height: 60,
                        child: OutlinedButton(
                          onPressed: () {

                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.teal[400]!),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            'Share Receipt',
                            style: TextStyle(
                                color: Color(0xFF429690), fontSize: 20),
                          ),
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
