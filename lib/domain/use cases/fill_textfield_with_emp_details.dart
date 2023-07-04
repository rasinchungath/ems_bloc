import 'package:ems_bloc/domain/models/employee_model.dart';
import 'package:flutter/material.dart';
import '../models/textfield_model.dart';

class FillTextField {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController empIDController = TextEditingController();
  final TextEditingController dObController = TextEditingController();
  final TextEditingController dOjController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adLine1Controller = TextEditingController();
  final TextEditingController adLine2Controller = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  EmpGender selectedGender = EmpGender.MALE;

  EmployeeTextField editEmployeeTextField(Employee employee) {
    empIDController.text = employee.id.toString();
    firstNameController.text = employee.empFirstName;
    lastNameController.text = employee.empLastName;
    dObController.text = employee.empDateOfBirth;
    dOjController.text = employee.empDateOfJoining;
    phoneController.text = employee.empPhoneNumber;
    emailController.text = employee.empEmailId;
    adLine1Controller.text = employee.empHomeAddrLine1;
    adLine2Controller.text = employee.empHomeAddrLine2;
    streetController.text = employee.empHomeAddrStreet;
    stateController.text = employee.empHomeAddrState;
    districtController.text = employee.empHomeAddrDistrict;
    countryController.text = employee.empHomeAddrCountry;
    pinController.text = employee.empHomeAddrPinCode;
    selectedGender = employee.empGender;
    return EmployeeTextField(
      firstNameController: firstNameController,
      lastNameController: lastNameController,
      empIDController: empIDController,
      dObController: dObController,
      dOjController: dOjController,
      phoneController: phoneController,
      emailController: emailController,
      adLine1Controller: adLine1Controller,
      adLine2Controller: adLine2Controller,
      streetController: streetController,
      stateController: stateController,
      districtController: districtController,
      pinController: pinController,
      countryController: countryController,
      selectedGender: selectedGender,
    );
  }
}
