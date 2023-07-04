import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Container(
        height: 30,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color(0XFFDFEAF0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            top: 5,
            bottom: 3,
          ),
          child: DropdownButton<EmpGender>(
            hint: const Text(
              'Gender',
              style: kcustomFieldStyle,
            ),
            value: empGender,
            onChanged: onChanged,
            underline: Container(color: Colors.transparent),
            isExpanded: true,
            icon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/Dropdown Icon.png',
                height: 18,
                width: 18,
              ),
            ),
            items: EmpGender.values.map((gender) {
              return DropdownMenuItem<EmpGender>(
                value: gender,
                child: Text(
                  gender.name,
                  style: kcustomFieldStyle,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
