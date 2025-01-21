import 'package:flutter/material.dart';
import 'package:incomeapp/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromRGBO(66, 150, 144, 1),
        child: const Center(
          child: Text(
            "MONO",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'inter',
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
