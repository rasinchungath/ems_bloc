import 'package:ems_bloc/domain/models/employee_model.dart';
import 'package:ems_bloc/presentation/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/gender_selector.dart';
import 'bloc/edit_employee_bloc.dart';

class EditEmployeeDetailsScreen extends StatefulWidget {
  const EditEmployeeDetailsScreen({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  State<EditEmployeeDetailsScreen> createState() =>
      _EditEmployeeDetailsScreenState();
}

class _EditEmployeeDetailsScreenState extends State<EditEmployeeDetailsScreen> {
  final EditEmployeeBloc editEmployeeBloc = EditEmployeeBloc();

  @override
  void initState() {
    super.initState();
    editEmployeeBloc.add(EditEmployeeInitialEvent(employee: widget.employee));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: customAppbar(title: 'Edit Employee details'),
        body: BlocConsumer<EditEmployeeBloc, EditEmployeeState>(
          bloc: editEmployeeBloc,
          listener: (context, state) {
            if (state is BackToPreviousPageState) {
              Navigator.pop(context);
            } else if (state is SaveEditedEmployeeDetailsState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            } else if (state is SavedEditedEmployeeSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Employee detail updated successfully'),
                ),
              );
            } else if (state is SavedEditedEmployeeFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to update Employee details'),
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case EditEmployeeTextFieldInitialState:
                final editEmployee = state as EditEmployeeTextFieldInitialState;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 20,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBackButton(
                              onPressed: () {
                                editEmployeeBloc.add(BackToPreviousPageEvent());
                              },
                            ),
                            CustomSaveButton(
                              onPressed: () async {
                                editEmployeeBloc.add(
                                  SaveEditedEmployeeDetailsEvent(
                                    employee: Employee(
                                      id: int.parse(editEmployee
                                          .employeeText.empIDController.text),
                                      empFirstName: editEmployee.employeeText
                                          .firstNameController.text,
                                      empLastName: editEmployee
                                          .employeeText.lastNameController.text,
                                      empGender: editEmployee
                                          .employeeText.selectedGender,
                                      empDateOfBirth: editEmployee
                                          .employeeText.dObController.text,
                                      empDateOfJoining: editEmployee
                                          .employeeText.dOjController.text,
                                      empPhoneNumber: editEmployee
                                          .employeeText.phoneController.text,
                                      empEmailId: editEmployee
                                          .employeeText.emailController.text,
                                      empHomeAddrLine1: editEmployee
                                          .employeeText.adLine1Controller.text,
                                      empHomeAddrLine2: editEmployee
                                          .employeeText.adLine2Controller.text,
                                      empHomeAddrStreet: editEmployee
                                          .employeeText.streetController.text,
                                      empHomeAddrDistrict: editEmployee
                                          .employeeText.districtController.text,
                                      empHomeAddrState: editEmployee
                                          .employeeText.stateController.text,
                                      empHomeAddrCountry: editEmployee
                                          .employeeText.countryController.text,
                                      empHomeAddrPinCode: editEmployee
                                          .employeeText.pinController.text,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 580,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Blue Window.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/images/Profile Picture.png',
                                    height: 120,
                                    width: 120,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.firstNameController,
                                    hintText: 'First name',
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.lastNameController,
                                    hintText: 'Last name',
                                  ),
                                ],
                              ),
                              GenderSelector(
                                empGender:
                                    editEmployee.employeeText.selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    editEmployee.employeeText.selectedGender =
                                        newValue!;
                                  });
                                },
                              ),
                              CustomTextField(
                                keyboardType: TextInputType.datetime,
                                controller:
                                    editEmployee.employeeText.dObController,
                                hintText: 'Date of Birth',
                              ),
                              CustomTextField(
                                keyboardType: TextInputType.datetime,
                                controller:
                                    editEmployee.employeeText.dOjController,
                                hintText: 'Date of Joining',
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.phone,
                                    controller: editEmployee
                                        .employeeText.phoneController,
                                    hintText: 'Phone Number',
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: editEmployee
                                        .employeeText.emailController,
                                    hintText: 'Email',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.adLine1Controller,
                                    hintText: 'Address Line 1,',
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.adLine2Controller,
                                    hintText: 'Address Line 2',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.streetController,
                                    hintText: 'Street',
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.districtController,
                                    hintText: 'District',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.stateController,
                                    hintText: 'State',
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    controller: editEmployee
                                        .employeeText.countryController,
                                    hintText: 'Country',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                      keyboardType: TextInputType.number,
                                      controller: editEmployee
                                          .employeeText.pinController,
                                      hintText: 'Pin Code'),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  CustomSaveButton(
                                    onPressed: () async {
                                      editEmployeeBloc.add(
                                        SaveEditedEmployeeDetailsEvent(
                                          employee: Employee(
                                            id: int.parse(editEmployee
                                                .employeeText
                                                .empIDController
                                                .text),
                                            empFirstName: editEmployee
                                                .employeeText
                                                .firstNameController
                                                .text,
                                            empLastName: editEmployee
                                                .employeeText
                                                .lastNameController
                                                .text,
                                            empGender: editEmployee
                                                .employeeText.selectedGender,
                                            empDateOfBirth: editEmployee
                                                .employeeText
                                                .dObController
                                                .text,
                                            empDateOfJoining: editEmployee
                                                .employeeText
                                                .dOjController
                                                .text,
                                            empPhoneNumber: editEmployee
                                                .employeeText
                                                .phoneController
                                                .text,
                                            empEmailId: editEmployee
                                                .employeeText
                                                .emailController
                                                .text,
                                            empHomeAddrLine1: editEmployee
                                                .employeeText
                                                .adLine1Controller
                                                .text,
                                            empHomeAddrLine2: editEmployee
                                                .employeeText
                                                .adLine2Controller
                                                .text,
                                            empHomeAddrStreet: editEmployee
                                                .employeeText
                                                .streetController
                                                .text,
                                            empHomeAddrDistrict: editEmployee
                                                .employeeText
                                                .districtController
                                                .text,
                                            empHomeAddrState: editEmployee
                                                .employeeText
                                                .stateController
                                                .text,
                                            empHomeAddrCountry: editEmployee
                                                .employeeText
                                                .countryController
                                                .text,
                                            empHomeAddrPinCode: editEmployee
                                                .employeeText
                                                .pinController
                                                .text,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
