import 'package:expense_tracker/controller/statemanagement/navigation_provider.dart';
import 'package:expense_tracker/view/add_expense.dart';
import 'package:expense_tracker/view/profile_screen.dart';
import 'package:expense_tracker/view/statistics_screen.dart';
import 'package:expense_tracker/view/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
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
        child: BottomAppBar(
          notchMargin: navigationProvider.currentIndex == 0 ? 10 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navigationProvider.currentIndex == 0
                ? [
                    IconButton(
                      icon: SvgPicture.asset(
                          'assets/images/icons/homepage_selected.svg'),
                      onPressed: () => navigationProvider.updateIndex(0),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                          'assets/images/icons/statistics_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(1),
                    ),
                    const SizedBox(width: 48), // Space for the FAB
                    IconButton(
                      icon: SvgPicture.asset(
                          'assets/images/icons/wallet_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(2),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                          'assets/images/icons/profile_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(3),
                    ),
                  ]
                : [
                    IconButton(
                      icon: SvgPicture.asset(
                          'assets/images/icons/homepage_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(0),
                    ),
                    IconButton(
                      icon: navigationProvider.currentIndex == 1
                          ? SvgPicture.asset(
                              'assets/images/icons/statistics_selected.svg')
                          : SvgPicture.asset(
                              'assets/images/icons/statistics_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(1),
                    ),
                    IconButton(
                      icon: navigationProvider.currentIndex == 2
                          ? SvgPicture.asset(
                              'assets/images/icons/wallet_selected.svg')
                          : SvgPicture.asset(
                              'assets/images/icons/wallet_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(2),
                    ),
                    IconButton(
                      icon: navigationProvider.currentIndex == 3
                          ? SvgPicture.asset(
                              'assets/images/icons/profile_selected.svg')
                          : SvgPicture.asset(
                              'assets/images/icons/profile_unselected.svg'),
                      onPressed: () => navigationProvider.updateIndex(3),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
