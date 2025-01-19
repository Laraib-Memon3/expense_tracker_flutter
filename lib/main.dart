import 'package:expense_tracker/controller/preferences/usage_preferences.dart';
import 'package:expense_tracker/controller/statemanagement/add_expense_provider.dart';
import 'package:expense_tracker/controller/statemanagement/balance_visibility_provider.dart';
import 'package:expense_tracker/controller/statemanagement/connect_wallet_provider.dart';
import 'package:expense_tracker/controller/statemanagement/navigation_provider.dart';
import 'package:expense_tracker/controller/statemanagement/statistics_provider.dart';
import 'package:expense_tracker/controller/statemanagement/wallet_provider.dart';
import 'package:expense_tracker/view/main_screens.dart';
import 'package:expense_tracker/view/onboarding_screen.dart';
import 'package:expense_tracker/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final UsagePreferences prefs = UsagePreferences();
  final bool notFirstTime = await prefs.isFirstTime;
  final bool onBoardingCompleted = await prefs.onBoardingCompleted;
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => BalanceVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => StatisticsProvider()),
        ChangeNotifierProvider(create: (_) => AddExpenseProvider()),
        ChangeNotifierProvider(create: (_) => ConnectWalletProvider()),
      ],
      child: MyApp( notFirstTime: notFirstTime, onBoardingCompleted: onBoardingCompleted),
    )
  );
}

class MyApp extends StatelessWidget {

  final bool notFirstTime;
  final bool onBoardingCompleted;

  MyApp({super.key, required this.notFirstTime, required this.onBoardingCompleted});

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
      home: notFirstTime ? (onBoardingCompleted ? MainScreen() : OnboardingScreen()) : SplashScreen(),
    );
  }
}

