import 'package:flutter/material.dart';

class ReusableCircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const ReusableCircularButton({super.key, required this.onPressed, required this.title});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff69AEA9), Color(0xff3F8782)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ),
    );
  }
}
