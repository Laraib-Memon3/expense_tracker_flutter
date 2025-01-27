import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incomeapp/Model/transaction_details_model.dart';
import 'package:incomeapp/View/transaction_details.dart';
import 'package:incomeapp/controller/statemanagement/navigation_provider.dart';
import 'package:incomeapp/controller/statemanagement/wallet_provider.dart';
import 'package:provider/provider.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});
    @override
    Widget build(BuildContext context) {

      listViewBuilder(bool transactionPage, List<TransactionDetailsModel> list,
          double mqh, double mqw) {
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionDetails(transactionDetails: list[index])));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: mqh * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            list[index].avatarPath,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: mqw * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list[index].transactionFrom,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(list[index].transactionDate),
                            ],
                          ),
                        ),
                      ],
                    ),
                    transactionPage
                        ? list[index].transactionStatus == 'Income'
                        ? Text("\$ ${list[index].transactionTotal}",
                        style: const TextStyle(color: Colors.green))
                        : Text("\$ -${list[index].transactionTotal}",
                        style: const TextStyle(
                          color: Colors.red,
                        ))
                        : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(236, 249, 248, 1),
                        ),
                        child: const Text(
                          'Pay',
                          style: TextStyle(color: Color.fromRGBO(63, 141, 136, 1)),
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }
      String orientation = MediaQuery.of(context).orientation.toString();
      double mqw = orientation.substring(12) == "portrait" ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
      double mqh = orientation.substring(12) == "portrait" ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;
      List<TransactionDetailsModel> transactions = [
        TransactionDetailsModel(
          avatarPath: 'assets/images/donut.png',
          transactionStatus: 'Income',
          transactionDate: 'Today',
          transactionTime: '10:00 AM',
          transactionFrom: 'John Doe',
          transactionAmount: 1000,
          transactionFee: 100,
          transactionTotal: 900,
        ),
        TransactionDetailsModel(
          avatarPath: 'assets/images/donut.png',
          transactionStatus: 'Expense',
          transactionDate: 'Yesterday',
          transactionTime: '10:00 AM',
          transactionFrom: 'Jane Doe',
          transactionAmount: 50,
          transactionFee: 0,
          transactionTotal: 50,
        ),
        TransactionDetailsModel(
          avatarPath: 'assets/images/donut.png',
          transactionStatus: 'Expense',
          transactionDate: 'Yesterday',
          transactionTime: '10:00 AM',
          transactionFrom: 'John Doe',
          transactionAmount: 100,
          transactionFee: 0,
          transactionTotal: 100,
        ),
        TransactionDetailsModel(
          avatarPath: 'assets/images/donut.png',
          transactionStatus: 'Income',
          transactionDate: 'Yesterday',
          transactionTime: '10:00 AM',
          transactionFrom: 'Jane Doe',
          transactionAmount: 340,
          transactionFee: 10,
          transactionTotal: 350,
        ),
      ];

      return Stack(
        clipBehavior: Clip.none, // Allows the children to overflow
        children: [
          const Image(
            image: AssetImage('assets/images/back.png'),
          ),
          const Image(
            image: AssetImage('assets/images/design.png'),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Wallet',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/splash'));
                },
              ),
              actions: [
                Container(
                  width: mqw * 0.11,
                  height: mqh * 0.05,
                  margin: EdgeInsets.only(right: mqw * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(63, 141, 136, 1),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notification_add_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: mqh,
                width: double.infinity,
                margin: EdgeInsets.only(top: mqh * 0.04),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mqh * 0.07,
                    ),
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: mqw * 0.04,
                      ),
                    ),
                    Text(
                      '\$',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mqw * 0.08,
                      ),
                    ),
                    SizedBox(
                      height: mqh * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mqw * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/add.svg',
                                  width: mqw * 0.1,
                                  height: mqh * 0.06,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mqw * 0.02, vertical: mqh * 0.01),
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: mqw * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/add');
                            },
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/qr.svg',
                                  width: mqw * 0.1,
                                  height: mqh * 0.06,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mqw * 0.02, vertical: mqh * 0.01),
                                  child: Text(
                                    'Pay',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: mqw * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/send.svg',
                                  width: mqw * 0.1,
                                  height: mqh * 0.06,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mqw * 0.02, vertical: mqh * 0.01),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: mqw * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<WalletProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: mqw * 0.05, vertical: mqh * 0.02),
                          height: mqh * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: mqw * 0.43,
                                height: mqh * 0.04,
                                decoration: BoxDecoration(
                                  color: value.isTransactionSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Text(
                                      "Transactions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: mqw * 0.04,
                                      ),
                                    ),
                                    onTap: () {
                                      // setState(() {
                                       Provider.of<WalletProvider>(context, listen: false).toggleTab(true);
                                      // });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                  width: mqw * 0.43,
                                  height: mqh * 0.04,
                                  decoration: BoxDecoration(
                                    color: value.isTransactionSelected
                                        ? Colors.transparent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          // setState(() {
                                          Provider.of<WalletProvider>(context, listen: false).toggleTab(false);
                                          // });
                                        },
                                        child: Text(
                                          "Upcoming Bills",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: mqw * 0.04,
                                          ),
                                        ),
                                      )))
                            ],
                          ),
                        );
                      },
                    ),
                    Consumer<WalletProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                        return value.isTransactionSelected
                            ? Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: mqw * 0.1),
                            child: listViewBuilder(
                                value.isTransactionSelected, transactions, mqh, mqw),
                          ),
                        )
                            : Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: mqw * 0.1),
                            child: listViewBuilder(
                                value.isTransactionSelected, transactions, mqh, mqw),
                          ),
                        );
                      },
                    )

                  ],
                ),
              ),
            ),
            // bottomNavigationBar: Consumer<NavigationProvider>(builder: (context, value, child) {
            //   return BottomNavigationBar(
            //     elevation: 8,
            //     backgroundColor: Colors.white,
            //     selectedItemColor: const Color.fromRGBO(63, 141, 136, 1),
            //     unselectedItemColor: Colors.grey,
            //     items: const <BottomNavigationBarItem>[
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.home_outlined),
            //         label: 'Home',
            //       ),
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.bar_chart),
            //         label: 'Statistics',
            //       ),
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.wallet),
            //         label: 'Wallet',
            //       ),
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.person),
            //         label: 'Profile',
            //       ),
            //     ],
            //     currentIndex: value.currentIndex,
            //     onTap:
            //     (index){
            //         // setState(() {
            //         Provider.of<NavigationProvider>(context, listen: false).updateIndex(index);
            //         // });
            //         if (index == 0) {
            //           Navigator.pushReplacementNamed(context, '/home');
            //         } else if (index == 1) {
            //           Navigator.pushReplacementNamed(context, '/statistics');
            //         } else if (index == 2) {
            //           Navigator.pushReplacementNamed(context, '/wallet');
            //         } else if (index == 3) {
            //           Navigator.pushReplacementNamed(context, '/profile');
            //         }
            //     },
            //   );
            // }
            ),
        ],
      );
    }
  }

