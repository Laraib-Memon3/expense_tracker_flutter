import 'package:expense_tracker/controller/statemanagement/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => WalletProvider(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff429690), Color(0xff2A7C76)],
            ),
          ),
          child: Column(
            children: [
              _buildHeader(context),
              _buildBody(context, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            ),
            const Text(
              'Wallet',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xff3F8782),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, double screenWidth) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Total Balance',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '\$ 2,548.00',
                style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconColumn(Icons.add, 'Add'),
                  const SizedBox(width: 20),
                  _buildIconColumn(Icons.share, 'Pay'),
                  const SizedBox(width: 20),
                  _buildIconColumn(Icons.send, 'Send'),
                ],
              ),
              const SizedBox(height: 20),
              _buildTabBar(context, screenWidth),
              const SizedBox(height: 10),
              _buildList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, double screenWidth) {
    final walletProvider = Provider.of<WalletProvider>(context);

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
              onTap: () => walletProvider.toggleTab(true),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: walletProvider.isTransactionSelected
                      ? Colors.white
                      : null,
                ),
                child: const Text(
                  'Transactions',
                  style: TextStyle(color: Color(0xff666666), fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => walletProvider.toggleTab(false),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: walletProvider.isTransactionSelected
                      ? null
                      : Colors.white,
                ),
                child: const Text(
                  'Upcoming Bills',
                  style: TextStyle(color: Color(0xff666666), fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Expanded(
      child: walletProvider.isTransactionSelected
          ? _buildTransactionList()
          : _buildUpcomingBillsList(),
    );
  }

  Column _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: const Color(0xff549994),
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xff549994),
          ),
        ),
        const SizedBox(height: 10),
        Text(label),
      ],
    );
  }

  Widget _buildTransactionList() {
    return ListView(
      children:  [
        ListTile(
          leading: Image.asset(
            'assets/images/upwork.png',
            height: 30,
            width: 30,
          ),
          title: const Text("Upwork"),
          subtitle: const Text("Today"),
          trailing: const Text(
            "+\$850.00",
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Inter',
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            'assets/images/transfer.png',
            height: 30,
            width: 30,
          ),
          title: const Text("Transfer"),
          subtitle: const Text("Yesterday"),
          trailing: const Text(
            "-\$85.00",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontFamily: 'Inter',
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            'assets/images/paypal.png',
            height: 30,
            width: 30,
          ),
          title: const Text("PayPal"),
          subtitle: const Text("Jan 30, 2022"),
          trailing: const Text(
            "+\$1406.00",
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Inter',
            ),
          ),
        ),
        ListTile(
          leading: Image.asset(
            'assets/images/youtube.png',
            height: 30,
            width: 30,
          ),
          title: const Text("YouTube"),
          subtitle: const Text("Jan 16, 2022"),
          trailing: const Text(
            "-\$11.99",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingBillsList() {
    return ListView(
      children:  [
        ListTile(
          leading: Image.asset('assets/images/youtube.png', height: 30, width: 30),
          title: Text('YouTube'),
          subtitle: Text('Feb 28, 2022'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xffECF9F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Pay',
              style: TextStyle(
                color: Color(0xff438883),
                fontSize: 16,
              ),
            ),
          )
        ),
        ListTile(
          leading: Image.asset('assets/images/electricity.png', height: 30, width: 30),
          title: Text('Electricity'),
          subtitle: Text('Mar 1, 2022'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xffECF9F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Pay',
              style: TextStyle(
                color: Color(0xff438883),
                fontSize: 16,
              ),
            ),
          )
        ),
        ListTile(
          leading: Image.asset('assets/images/house.png', height: 30, width: 30),
          title: Text('House Rent'),
          subtitle: Text('Mar 1, 2022'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xffECF9F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Pay',
              style: TextStyle(
                color: Color(0xff438883),
                fontSize: 16,
              ),
            ),
          )
        ),
        ListTile(
          leading: Image.asset('assets/images/spotify.png', height: 30, width: 30),
          title: Text('Spotify'),
          subtitle: Text('Mar 1, 2022'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xffECF9F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Pay',
              style: TextStyle(
                color: Color(0xff438883),
                fontSize: 16,
              ),
              ),
              )),

      ],
    );
  }
}




