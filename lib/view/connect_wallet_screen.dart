import 'package:expense_tracker/controller/statemanagement/connect_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ConnectWalletScreen extends StatelessWidget {
  const ConnectWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF429690),
      body: Column(
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF429690),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {},
                    ),
                    const Text(
                      "Connect Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/icons/notifications.svg',
                      ),
                    ),
                    // Stack(
                    //   children: [
                    //     IconButton(
                    //       icon: const Icon(Icons.notifications,
                    //           color: Colors.white),
                    //       onPressed: () {},
                    //     ),
                    //     Positioned(
                    //       right: 8,
                    //       top: 8,
                    //       child: Container(
                    //         width: 8,
                    //         height: 8,
                    //         decoration: const BoxDecoration(
                    //           color: Colors.orange,
                    //           shape: BoxShape.circle,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
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
                      _buildTabBar(context, screenWidth),
                      const SizedBox(height: 20),
                      _buildBody(context),
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

  Widget _buildTabBar(BuildContext context, double screenWidth) {
    final connectWalletProvider = Provider.of<ConnectWalletProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: const EdgeInsets.all(5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffF4F6F6),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => connectWalletProvider.toggleTab(true),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: connectWalletProvider.isCardsSelected
                      ? Colors.white
                      : null,
                ),
                child: const Text(
                  'Cards',
                  style: TextStyle(color: Color(0xff666666), fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => connectWalletProvider.toggleTab(false),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: connectWalletProvider.isCardsSelected
                      ? null
                      : Colors.white,
                ),
                child: const Text(
                  'Accounts',
                  style: TextStyle(color: Color(0xff666666), fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final connectWalletProvider = Provider.of<ConnectWalletProvider>(context);

    return connectWalletProvider.isCardsSelected
        ? _buildCardsBody()
        : _buildAccountsBody(context);
  }

  Widget _buildCardsBody() {
    return Column(
      children: [
        Container(
            child: SvgPicture.asset(
          'assets/images/Cards.svg',
        )),

        const SizedBox(height: 20),
        const Text(
          "Add your debit Card",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          "This card must be connected to a bank account under your name",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: "NAME ON CARD",
            labelStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Colors.teal), // Teal border color
            ),
            focusedBorder: OutlineInputBorder(
              // Style for focused state
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                  color: Colors.teal, width: 2.0), // Thicker border on focus
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0, horizontal: 12.0), // Padding inside the field
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "DEBIT CARD NUMBER",
                  labelStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        color: Colors.grey), // Light gray border
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "CVC",
                  labelStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "EXPIRATION MM/YY",
                  labelStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "ZIP",
                  labelStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const BankLinkScreen()),
        //     );
        //   },
        //   child: const Text('Go to Bill Payment Receipt'),
        // ),
      ],
    );
  }

  Widget _buildAccountsBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100, // Added Container for background color
          decoration: BoxDecoration(
            color: Color(0xFF4388831A).withOpacity(0.1), // Background color
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.home, color: Color(0xFF429690)),
                  backgroundColor: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Bank Link',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF429690), // Or any color you prefer
                      ),
                    ),
                    Text(
                      'Connect your bank',
                      style: const TextStyle(
                        color: Color(
                            0xFF429690), // Example: slightly transparent black
                      ),
                    ),
                    Text(
                      'account to deposit & fund',
                      style: const TextStyle(
                        color: Color(
                            0xFF429690), // Example: slightly transparent black
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.check, color: Colors.white),
                  backgroundColor: Color(0xFF429690)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 100, // Added Container for background color
          decoration: BoxDecoration(
            color: Colors.grey.shade50, // Background color
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Icon(Icons.attach_money, color: Colors.white),
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Microdeposits',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Connect bank in 5-7 days'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 100, // Added Container for background color
          decoration: BoxDecoration(
            color: Colors.grey.shade50, // Background color
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.payment, color: Colors.grey),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Paypal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Connect your paypal account'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 120),
        Center(
          child: SizedBox(
            width: 400.0,
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Account connected successfully!')),
                );
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF429690)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Color(0xFF429690), fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
