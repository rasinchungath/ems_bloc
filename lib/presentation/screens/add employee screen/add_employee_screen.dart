import 'package:ems_bloc/presentation/screens/add%20employee%20screen/bloc/add_employee_bloc.dart';
import 'package:ems_bloc/presentation/screens/add%20employee%20screen/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/employee_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/gender_selector.dart';
import '../home screen/home_screen.dart';

class AddEmployeeDetailsScreen extends StatefulWidget {
  const AddEmployeeDetailsScreen({
    super.key,
  });

  @override
  State<AddEmployeeDetailsScreen> createState() =>
      _AddEmployeeDetailsScreenState();
}

class _AddEmployeeDetailsScreenState extends State<AddEmployeeDetailsScreen> {
  EmpGender selectedGender = EmpGender.MALE;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController empIDController = TextEditingController();
  TextEditingController dObController = TextEditingController();
  TextEditingController dOjController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adLine1Controller = TextEditingController();
  TextEditingController adLine2Controller = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  final AddEmployeeBloc addEmployeeBloc = AddEmployeeBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: customAppbar(title: 'Add Employee details'),
        body: BlocListener(
          bloc: addEmployeeBloc,
          listener: (context, state) {
            if (state is PreviousPagePopState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            } else if (state is SavedNewEmployeeSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('New Employee details added successfully'),
                ),
              );
            } else if (state is SaveNewEmployeeFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to add new Employee'),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 20, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(
                        onPressed: () {
                          addEmployeeBloc.add(PreviousPagePopEvent());
                        },
                      ),
                      CustomSaveButton(
                        onPressed: () async {
                          addEmployeeBloc.add(
                            SaveNewEmployeeDetailsEvent(
                              employee: Employee(
                                empFirstName: firstNameController.text,
                                empLastName: lastNameController.text,
                                empGender: selectedGender,
                                empDateOfBirth: dObController.text,
                                empDateOfJoining: dOjController.text,
                                empPhoneNumber: phoneController.text,
                                empEmailId: emailController.text,
                                empHomeAddrLine1: adLine1Controller.text,
                                empHomeAddrLine2: adLine2Controller.text,
                                empHomeAddrStreet: streetController.text,
                                empHomeAddrDistrict: districtController.text,
                                empHomeAddrState: stateController.text,
                                empHomeAddrCountry: countryController.text,
                                empHomeAddrPinCode: pinController.text,
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
                        const CircleProfileAvatar(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                                keyboardType: TextInputType.name,
                                controller: firstNameController,
                                hintText: 'First name'),
                            CustomTextField(
                                keyboardType: TextInputType.name,
                                controller: lastNameController,
                                hintText: 'Last name'),
                          ],
                        ),
                        GenderSelector(
                          empGender: selectedGender,
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue!;
                            });
                          },
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.datetime,
                          controller: dObController,
                          hintText: 'Date of Birth',
                        ),
                        CustomTextField(
                            keyboardType: TextInputType.datetime,
                            controller: dOjController,
                            hintText: 'Date of Joining'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                hintText: 'Phone Number'),
                            CustomTextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              hintText: 'Email',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                                keyboardType: TextInputType.name,
                                controller: adLine1Controller,
                                hintText: 'Address Line 1'),
                            CustomTextField(
                                keyboardType: TextInputType.name,
                                controller: adLine2Controller,
                                hintText: 'Address Line 2'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: streetController,
                              hintText: 'Street',
                            ),
                            CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: districtController,
                              hintText: 'District',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: stateController,
                              hintText: 'State',
                            ),
                            CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: countryController,
                              hintText: 'Country',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                                keyboardType: TextInputType.number,
                                controller: pinController,
                                hintText: 'Pin Code'),
                            const SizedBox(
                              width: 35,
                            ),
                            CustomSaveButton(
                              onPressed: () async {
                                addEmployeeBloc.add(
                                  SaveNewEmployeeDetailsEvent(
                                    employee: Employee(
                                      empFirstName: firstNameController.text,
                                      empLastName: lastNameController.text,
                                      empGender: selectedGender,
                                      empDateOfBirth: dObController.text,
                                      empDateOfJoining: dOjController.text,
                                      empPhoneNumber: phoneController.text,
                                      empEmailId: emailController.text,
                                      empHomeAddrLine1: adLine1Controller.text,
                                      empHomeAddrLine2: adLine2Controller.text,
                                      empHomeAddrStreet: streetController.text,
                                      empHomeAddrDistrict:
                                          districtController.text,
                                      empHomeAddrState: stateController.text,
                                      empHomeAddrCountry:
                                          countryController.text,
                                      empHomeAddrPinCode: pinController.text,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
