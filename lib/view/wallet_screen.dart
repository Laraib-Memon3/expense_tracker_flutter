import 'package:expense_tracker/controller/statemanagement/wallet_provider.dart';
import 'package:expense_tracker/model/userdata.dart';
import 'package:expense_tracker/view/bill_details_screen.dart';
import 'package:expense_tracker/view/connect_wallet_screen.dart';
import 'package:expense_tracker/view/transaction_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final Userdata _prefs = Userdata();

  Future<List<Map<String, dynamic>>> _fetchData() async {
    await _prefs.ensureDataList();
    return await _prefs.dataList;
  }

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
    return FutureBuilder(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available.'));
        } else {
          final data = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionDetailsScreen(
                          isIncome: item['amount'] > 0,
                          amount: item['amount'],
                          fee: 20,
                          from: item['title'],
                          date: item['date'],
                          time: '10 : 00AM',
                          image: item['imageUrl']),
                    ),
                  );
                },
                leading: Image.asset(
                  item['imageUrl'],
                  height: 30,
                  width: 30,
                ),
                title: Text(item['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                    )),
                subtitle: Text('${item['date']}',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff666666),
                        fontFamily: 'Inter')),
                trailing: Text(
                  '\$${item['amount']}',
                  style: TextStyle(
                    color: item['amount'] >= 0 ? Colors.green : Colors.red,
                    fontSize: 16,
                    fontFamily: 'Inter',
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildUpcomingBillsList(BuildContext context) {
    final defaultData = [
      {
        'title': 'YouTube Premium',
        'date': 'Feb 28, 2022',
        'price': 11.99,
        'fee': 1.99,
        'image': 'assets/images/youtube.png'
      },
      {
        'title': 'Electricity Bill',
        'date': 'Mar 1, 2022',
        'price': 50.00,
        'fee': 0.00,
        'image': 'assets/images/electricity.png'
      },
      {
        'title': 'House Rent',
        'date': 'Mar 1, 2022',
        'price': 500.00,
        'fee': 0.00,
        'image': 'assets/images/house.png'
      },
      {
        'title': 'Spotify Premium',
        'date': 'Mar 1, 2022',
        'price': 9.99,
        'fee': 0.00,
        'image': 'assets/images/spotify.png'
      },
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: defaultData.length,
      itemBuilder: (context, index) {
        final item = defaultData[index];
        return ListTile(
          leading: Image.asset(
            item['image'] as String,
            height: 30,
            width: 30,
          ),
          title: Text(item['title'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
              )),
          subtitle: Text('${item['date']}',
              style: const TextStyle(
                  fontSize: 12, color: Color(0xff666666), fontFamily: 'Inter')),
          trailing: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BillDetailsScreen(
                    title: item['title'] as String,
                    date: item['date'] as String,
                    price: item['price'] as double,
                    fee: item['fee'] as double,
                    image: item['image'] as String,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xffECF9F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                  color: Color(0xff438883),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
