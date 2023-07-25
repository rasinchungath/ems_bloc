import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors/colors.dart';

AppBar customAppbar({required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 69.h,
    flexibleSpace: Container(
      height: 69.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Top Header2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            letterSpacing: 0.6.sp,
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: kBGcolor,
          ),
        ),
      ),
    ),
  );
}
