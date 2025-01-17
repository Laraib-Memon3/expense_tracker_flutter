import 'package:expense_tracker/controller/statemanagement/navigation_provider.dart';
import 'package:expense_tracker/view/add_expense.dart';
import 'package:expense_tracker/view/profile_screen.dart';
import 'package:expense_tracker/view/statistics_screen.dart';
import 'package:expense_tracker/view/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final List<Widget> screens = [
      const HomepageScreen(),
      StatisticsScreen(),
      const WalletScreen(),
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
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.teal,
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: navigationProvider.currentIndex == 0 ? 10 : 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navigationProvider.currentIndex == 0
              ? [
            IconButton(
              icon: const Icon(Icons.home,
              color: Color(0xff408782),
              ),
              onPressed: () => navigationProvider.updateIndex(0),
            ),
            IconButton(
              icon: const Icon(Icons.stacked_bar_chart),
              onPressed: () => navigationProvider.updateIndex(1),
            ),
            const SizedBox(width: 48), // Space for the FAB
            IconButton(
              icon: const Icon(Icons.wallet),
              onPressed: () => navigationProvider.updateIndex(2),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => navigationProvider.updateIndex(3),
            ),
          ]
              : [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => navigationProvider.updateIndex(0),
            ),
            IconButton(
              icon: Icon(Icons.stacked_bar_chart,
                color: navigationProvider.currentIndex == 1
                    ? Color(0xff408782) // Selected color
                    : Color(0xffAAAAAA), // Unselected color
              ),
              onPressed: () => navigationProvider.updateIndex(1),
            ),
            IconButton(
              icon:  Icon(Icons.wallet,
                color: navigationProvider.currentIndex == 2
                    ? Color(0xff408782) // Selected color
                    : Color(0xffAAAAAA),
              ),
              onPressed: () => navigationProvider.updateIndex(2),
            ),
            IconButton(
              icon:  Icon(Icons.person,
                color: navigationProvider.currentIndex == 3
                    ? Color(0xff408782) // Selected color
                    : Color(0xffAAAAAA),
              ),
              onPressed: () => navigationProvider.updateIndex(3),
            ),
          ],
        ),
      ),
    );
  }
}










