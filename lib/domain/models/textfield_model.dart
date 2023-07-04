import 'package:flutter/material.dart';
import 'employee_model.dart';

class EmployeeTextField {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController empIDController;
  final TextEditingController dObController;
  final TextEditingController dOjController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController adLine1Controller;
  final TextEditingController adLine2Controller;
  final TextEditingController streetController;
  final TextEditingController stateController;
  final TextEditingController districtController;
  final TextEditingController pinController;
  final TextEditingController countryController;
  EmpGender selectedGender;

  EmployeeTextField({
    required this.firstNameController,
    required this.lastNameController,
    required this.empIDController,
    required this.dObController,
    required this.dOjController,
    required this.phoneController,
    required this.emailController,
    required this.adLine1Controller,
    required this.adLine2Controller,
    required this.streetController,
    required this.stateController,
    required this.districtController,
    required this.pinController,
    required this.selectedGender,
    required this.countryController,
  });
}
