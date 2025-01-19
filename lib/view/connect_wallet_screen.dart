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
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF429690),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/overlapping_cirlces.svg',
            ),
          ),
          Column(
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(),
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
          'assets/images/Card.svg',
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
                  const BorderSide(color: Colors.teal), 
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                  color: Colors.teal, width: 2.0), 
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0, horizontal: 12.0), 
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
                        color: Colors.grey), 
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
      ],
    );
  }

  Widget _buildAccountsBody(BuildContext context) {
    final connectWalletProvider = Provider.of<ConnectWalletProvider>(context);

    final accounts = [
      {
        'icon': 'assets/images/icons/bank.png',
        'title': 'Bank Link',
        'subtitle': 'Connect your bank account',
      },
      {
        'icon': 'assets/images/icons/microdeposits.png',
        'title': 'Microdeposits',
        'subtitle': 'Connect bank in 5-7 days',
      },
      {
        'icon': 'assets/images/icons/paypal.png',
        'title': 'Paypal',
        'subtitle': 'Connect your PayPal account',
      },
    ];

    return Column(
      children: [
        ...accounts.map((account) {
          final isSelected =
              connectWalletProvider.selectedAccount == account['title'];

          return GestureDetector(
            onTap: () =>
                connectWalletProvider.selectAccount(account['title'] as String),
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFFE0F7FA) : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor:
                        isSelected ? Colors.white : Colors.transparent,
                    child: Image.asset(account['icon'] as String),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          account['title'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? const Color(0xFF429690)
                                : Colors.black,
                          ),
                        ),
                        Text(
                          account['subtitle'] as String,
                          style: TextStyle(
                            color: isSelected
                                ? const Color(0xFF429690)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    SvgPicture.asset(
                      'assets/images/icons/confirmation_tick.svg',
                      height: 24,
                    ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 120),
        Center(
          child: SizedBox(
            width: 400.0,
            child: OutlinedButton(
              onPressed: connectWalletProvider.selectedAccount != null
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${connectWalletProvider.selectedAccount} connected successfully!')),
                      );
                      Navigator.pop(context);
                    }
                  : null,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF429690)),
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
