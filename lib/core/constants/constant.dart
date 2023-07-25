import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/colors.dart';

TextStyle kAppBarTextstyle = TextStyle(
  letterSpacing: 0.6.sp,
  fontWeight: FontWeight.w700,
  fontSize: 20.sp,
  color: kBGcolor,
);

const String uri = 'http://15.207.222.215:8080/api/employees';

const kSearchStyle = TextStyle(
  color: kSearchTextColor,
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
);

const homeTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 12,
  color: Color(0XFF41485F),
);

const kEmployeeDetailStyle = TextStyle(
  letterSpacing: 0.6,
  color: kEmployeeDetailTextColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle kcustomFieldStyle = TextStyle(
  letterSpacing: 0.6,
  color: kCustomTextFieldTextColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w300,
);
