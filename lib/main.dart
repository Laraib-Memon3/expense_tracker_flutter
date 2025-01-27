import 'package:incomeapp/controller/statemanagement/add_expense_provider.dart';
import 'package:incomeapp/controller/statemanagement/connect_wallet_provider.dart';
import 'package:incomeapp/controller/statemanagement/navigation_provider.dart';
import 'package:incomeapp/controller/statemanagement/statistics_provider.dart';
import 'package:incomeapp/controller/statemanagement/wallet_provider.dart';
import 'package:incomeapp/view/homepage_screen.dart';
import 'package:incomeapp/view/main_screens.dart';
import 'package:incomeapp/view/onboarding_screen.dart';
import 'package:incomeapp/view/profile_screen.dart';
import 'package:incomeapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:incomeapp/view/statistics_screen.dart';
import 'package:incomeapp/view/wallet.dart';
import 'package:provider/provider.dart';

import 'controller/statemanagement/balance_visibility_provider.dart';
void main() {

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => BalanceVisibilityProvider()),
        ChangeNotifierProvider(create: (context) => AddExpenseProvider()),
        ChangeNotifierProvider(create: (context) => BalanceVisibilityProvider()),
        ChangeNotifierProvider(create: (context) => ConnectWalletProvider()),
        ChangeNotifierProvider(create: (context) => StatisticsProvider()),
        ChangeNotifierProvider(create: (context) => WalletProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
        child: MyApp(
              notFirstTime: false,
              onBoardingCompleted: false,
            ),
      ));
}

class MyApp extends StatelessWidget {
  final bool notFirstTime;
  final bool onBoardingCompleted;

  MyApp(
      {super.key, required this.notFirstTime,
        required this.onBoardingCompleted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff3F8782)),
          useMaterial3: true,
          iconTheme: IconThemeData(color: Color(0xffAAAAAA)),
          bottomAppBarTheme: const BottomAppBarTheme(
            height: 60,
          ),
        ),
        home: notFirstTime
            ? (onBoardingCompleted ? MainScreen() : OnboardingScreen())
            : SplashScreen(),

      routes: {
          'home' : (context) => HomePageScreen(),
          'statistics' : (context) => StatisticsScreen(),
          'wallet' : (context) => Wallet(),
          'profile' : (context) => ProfileScreen(),
      },
        );
    }
}