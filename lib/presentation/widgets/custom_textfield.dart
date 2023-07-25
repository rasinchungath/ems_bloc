import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.r,
        bottom: 8.r,
      ),
      child: Container(
        height: 30.h,
        width: 150.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 0.5.r,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color(0XFFDFEAF0),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.r,
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 8.r,
                right: 8.r,
                bottom: 13.r,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                letterSpacing: 0.6,
                color: kCustomTextFieldTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              letterSpacing: 0.6,
              color: kCustomTextFieldTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
