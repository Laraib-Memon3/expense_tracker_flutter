import 'package:incomeapp/view/add_expense.dart';
import 'package:incomeapp/view/profile_screen.dart';
import 'package:incomeapp/view/statistics_screen.dart';
import 'package:incomeapp/view/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../controller/statemanagement/navigation_provider.dart';
import 'homepage_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final List<Widget> screens = [
      HomePageScreen(),
      StatisticsScreen(),
      Wallet(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[navigationProvider.currentIndex],
      floatingActionButton: navigationProvider.currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpenseScreen(),
                  ),
                );
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              backgroundColor: Colors.teal,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Consumer<NavigationProvider>(builder: (context, value, child) {
          return BottomNavigationBar(
            elevation: 8,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromRGBO(63, 141, 136, 1),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: value.currentIndex == 0
                    ? Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Icon(Icons.bar_chart),
                      )
                    : Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
              BottomNavigationBarItem(
                icon: value.currentIndex == 0
                    ? Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.wallet),
                )
                    : Icon(Icons.wallet),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: value.currentIndex,
            onTap: (index) {
              // setState(() {
              Provider.of<NavigationProvider>(context, listen: false)
                  .updateIndex(index);
              // });
              if (index == 0) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1) {
                Navigator.pushReplacementNamed(context, '/statistics');
              } else if (index == 2) {
                Navigator.pushReplacementNamed(context, '/wallet');
              } else if (index == 3) {
                Navigator.pushReplacementNamed(context, '/profile');
              }
            },
          );
        }),
      ),
    );
  }
}
