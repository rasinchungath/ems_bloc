import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:  TextStyle(
        letterSpacing: 0.6,
        color: const Color(0XFFDFEAF0),
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
