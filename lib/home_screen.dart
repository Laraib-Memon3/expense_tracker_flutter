import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center, // Centers all children within the Stack
        children: [
          // Rectangle background
          Image.asset(
            'assets/images/rectan.png',
            width: 410,
            height: 600,
            fit: BoxFit.cover,
          ),
          // Centered man image with reduced left space
          Column(
            mainAxisSize: MainAxisSize.min, // Keeps the column compact
            children: [
              SizedBox(height: 200), // Adjust the height as needed
              Padding(
                padding: const EdgeInsets.only(left: 50), // Adjust this value to reduce space from the left
                child: Image.asset(
                  'assets/images/man.png',
                  width: 400, // Adjust width to fit nicely in the rectangle
                  height: 400, // Adjust height to fit nicely in the rectangle
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min, // Keeps the column compact
            children: [
              SizedBox(width: 0), // Adjust the height as needed
              Image.asset(
                'assets/images/coint.png',
                width: 100, // Adjust width to fit nicely in the rectangle
                height: 200, // Adjust height to fit nicely in the rectangle
                fit: BoxFit.contain,
              ),
            ],
          )
        ],
      ),
    );
  }
}
