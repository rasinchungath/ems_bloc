import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/colors/colors.dart';

AppBar homeAppbar = AppBar(
  toolbarHeight: 124.h,
  flexibleSpace: Container(
    height: 124.h,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/Top Header.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 22.h, bottom: 22.h, right: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              'EMPLOYEE',
              style: TextStyle(
                letterSpacing: 0.6,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: kBGcolor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'MANAGEMENT',
              style: TextStyle(
                letterSpacing: 0.6,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: kBGcolor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'SYSTEM',
              style: TextStyle(
                letterSpacing: 0.6.sp,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: kBGcolor,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
