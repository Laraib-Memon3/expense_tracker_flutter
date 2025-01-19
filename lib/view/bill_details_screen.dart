import 'package:expense_tracker/view/bill_payment_screen.dart';
import 'package:expense_tracker/view/widgets/reusable_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PaymentMethodProvider with ChangeNotifier {
  String _selectedMethod = "Debit Card";

  String get selectedMethod => _selectedMethod;

  void selectMethod(String method) {
    _selectedMethod = method;
    notifyListeners();
  }
}

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => PaymentMethodProvider(),
      child: Scaffold(
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
                            "Bill Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_horiz,
                                color: Colors.white),
                            onPressed: () {
                              // Handle three-dot menu press here
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
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24.0)),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
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
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                date,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
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
                            const Text('Price'),
                            Text('\$${price.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Fee'),
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
                            const Text('Total',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('\$${(price + fee).toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 34),
                      const Text("Select payment method",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 16),
                      Consumer<PaymentMethodProvider>(
                        builder: (context, provider, child) {
                          return Column(
                            children: [
                              _buildPaymentOption(
                                context,
                                provider,
                                method: "Debit Card",
                                icon: Icons.credit_card,
                                isSelected:
                                    provider.selectedMethod == "Debit Card",
                              ),
                              const SizedBox(height: 16),
                              _buildPaymentOption(
                                context,
                                provider,
                                method: "Paypal",
                                icon: Icons.paypal,
                                isSelected: provider.selectedMethod == "Paypal",
                              ),
                            ],
                          );
                        },
                      ),
                      Spacer(),
                      ReusableCircularButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BillPaymentScreen(
                                          title: title,
                                          price: price,
                                          fee: fee,
                                          image: image,
                                        )));
                          },
                          title: 'Pay Now'),
                      SizedBox(
                        height: screenHeight * 0.05,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
      BuildContext context, PaymentMethodProvider provider,
      {required String method,
      required IconData icon,
      required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        provider.selectMethod(method);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? const Color(0xFF429690) : Colors.grey[400]),
            const SizedBox(width: 16),
            Text(method, style: const TextStyle(fontWeight: FontWeight.w500)),
            const Spacer(),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? const Color(0xFF429690) : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
