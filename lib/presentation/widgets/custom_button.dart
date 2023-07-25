import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors/colors.dart';

class CustomSaveButton extends StatelessWidget {
  const  CustomSaveButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 15.h, right: 10.w, bottom: 15.h),
      child: SizedBox(
        width: 94.w,
        height: 44.h,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStateProperty.all(kbuttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: onPressed,
          child:  Text(
            'Save',
            style: TextStyle(
              letterSpacing: 0.6.sp,
              color: const Color(0XFFFFFFFF),
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}