
import 'package:incomeapp/view/main_screens.dart';
import 'package:incomeapp/widgets/reusable_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/usage_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: screenHeight * 0.7,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/images/onboarding_bg.svg'),
                  Positioned(
                    bottom: 0,
                    child: Image.asset('assets/images/onboarding_person.png'),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Spend Smarter \nSave More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff438883),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                ReusableCircularButton(
                    onPressed: () {
                      UsagePreferences().setOnBoardingCompleted(true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    title: 'Get Started'),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Already Have Account? ',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Color(0xff3F8782),
                          fontSize: 12,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
