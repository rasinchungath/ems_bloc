import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        letterSpacing: 0.6,
        color: Color(0XFFDFEAF0),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
