import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors/colors.dart';
import '../../core/constants/constant.dart';
import '../../domain/models/employee_model.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.empGender,
    required this.onChanged,
  });
  final EmpGender empGender;
  final void Function(EmpGender?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
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
          padding:  EdgeInsets.only(
            left: 18.r,
            top: 5.r,
            bottom: 3.r,
          ),
          child: DropdownButton<EmpGender>(
            hint:  Text(
              'Gender',
              style: kcustomFieldStyle,
            ),
            value: empGender,
            onChanged: onChanged,
            underline: Container(color: Colors.transparent),
            isExpanded: true,
            icon: Padding(
              padding:  EdgeInsets.only(right: 10.r),
              child: Image.asset(
                'assets/images/Dropdown Icon.png',
                height: 18.h,
                width: 18.w,
              ),
            ),
            items: EmpGender.values.map((gender) {
              return DropdownMenuItem<EmpGender>(
                value: gender,
                child: Text(
                  gender.name,
                  style: TextStyle(
                letterSpacing: 0.6,
                color: kCustomTextFieldTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
