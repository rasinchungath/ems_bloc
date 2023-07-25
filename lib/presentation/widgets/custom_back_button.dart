import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: kBackButtonColor,
      padding: const EdgeInsets.all(0),
      shape: const CircleBorder(),
      child:  Icon(
        Icons.arrow_back,
        color: kBGcolor,
        size: 30.sp,
      ),
    );
  }
}
