import 'package:expense_tracker/controller/statemanagement/wallet_provider.dart';
import 'package:expense_tracker/view/bill_details_screen.dart';
import 'package:expense_tracker/view/connect_wallet_screen.dart';
import 'package:expense_tracker/view/transaction_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => WalletProvider(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff429690), Color(0xff2A7C76)],
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
            Container(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildBody(context, screenWidth),
                ],
              ),
            ),
          ],
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
              onPressed: () {},
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
                  _buildIconColumn('assets/images/icons/add.svg', 'Add', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => ConnectWalletScreen()));
                  }),
                  const SizedBox(width: 20),
                  _buildIconColumn('assets/images/icons/pay.svg', 'Pay', () {}),
                  const SizedBox(width: 20),
                  _buildIconColumn(
                      'assets/images/icons/send.svg', 'Send', () {}),
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
          ? _buildTransactionList(context)
          : _buildUpcomingBillsList(context),
    );
  }

  Widget _buildIconColumn(String icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
            child: SvgPicture.asset(
              icon,
            ),
          ),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionDetailsScreen(
                          isIncome: true,
                          amount: 870,
                          fee: 20,
                          from: 'Upwork Escrow',
                          date: 'Feb 30, 2022',
                          time: '10:00 AM',
                          image: 'assets/images/upwork.png',
                        )));
          },
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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionDetailsScreen(
                          isIncome: false,
                          amount: 85,
                          fee: 0.99,
                          from: 'Claire Jovalski',
                          date: 'Feb 29, 2022',
                          time: '04:30 PM',
                          image: 'assets/images/transfer.png',
                        )));
          },
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
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionDetailsScreen(
                        isIncome: true,
                        amount: 1406,
                        fee: 0,
                        from: 'PayPal',
                        date: 'Jan 30, 2022',
                        time: '12:00 PM',
                        image: 'assets/images/paypal.png',
                      ))),
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
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionDetailsScreen(
                        isIncome: false,
                        amount: 11.99,
                        fee: 0,
                        from: 'YouTube',
                        date: 'Jan 16, 2022',
                        time: '08:00 PM',
                        image: 'assets/images/youtube.png',
                      ))),
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

  Widget _buildUpcomingBillsList(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            leading:
                Image.asset('assets/images/youtube.png', height: 30, width: 30),
            title: Text('YouTube'),
            subtitle: Text('Feb 28, 2022'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BillDetailsScreen(
                              title: 'YouTube Premium',
                              date: 'Feb 28, 2022',
                              price: 11.99,
                              fee: 1.99,
                              image: 'assets/images/youtube.png',
                            )));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffECF9F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Color(0xff438883),
                    fontSize: 16,
                  ),
                ),
              ),
            )),
        ListTile(
            leading: Image.asset('assets/images/electricity.png',
                height: 30, width: 30),
            title: Text('Electricity'),
            subtitle: Text('Mar 1, 2022'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BillDetailsScreen(
                              title: 'Electricity Bill',
                              date: 'Mar 1, 2022',
                              price: 50.00,
                              fee: 0.00,
                              image: 'assets/images/electricity.png',
                            )));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffECF9F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Color(0xff438883),
                    fontSize: 16,
                  ),
                ),
              ),
            )),
        ListTile(
            leading:
                Image.asset('assets/images/house.png', height: 30, width: 30),
            title: Text('House Rent'),
            subtitle: Text('Mar 1, 2022'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BillDetailsScreen(
                              title: 'House Rent',
                              date: 'Mar 1, 2022',
                              price: 500.00,
                              fee: 0.00,
                              image: 'assets/images/house.png',
                            )));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffECF9F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Color(0xff438883),
                    fontSize: 16,
                  ),
                ),
              ),
            )),
        ListTile(
            leading:
                Image.asset('assets/images/spotify.png', height: 30, width: 30),
            title: Text('Spotify'),
            subtitle: Text('Mar 1, 2022'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BillDetailsScreen(
                              title: 'Spotify Premium',
                              date: 'Mar 1, 2022',
                              price: 9.99,
                              fee: 0.00,
                              image: 'assets/images/spotify.png',
                            )));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffECF9F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Color(0xff438883),
                    fontSize: 16,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
