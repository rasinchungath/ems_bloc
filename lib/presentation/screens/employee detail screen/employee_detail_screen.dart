import 'package:ems_bloc/presentation/screens/edit%20employee%20screen/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text.dart';
import '../home screen/bloc/home_bloc.dart';
import 'bloc/employee_detail_bloc.dart';
import 'widgets/edit_button.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  EmployeeDetailsScreen({
    super.key,
    //required this.employee,
    required this.homeBloc,
  });
  //final Employee employee;
  final HomeBloc homeBloc;
  final EmployeeDetailBloc employeeDetailBloc = EmployeeDetailBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(title: 'Employee details'),
        body: BlocListener<EmployeeDetailBloc, EmployeeDetailState>(
          bloc: employeeDetailBloc,
          listener: (context, state) {
            if (state is BackToHomeNavigateState) {
              homeBloc.add(HomeInitialEvent());
              Navigator.pop(context);
            } else if (state is EditEmployeeDetailState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditEmployeeDetailsScreen(
                            homeBloc: homeBloc,
                          )));
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 10, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(
                        onPressed: () {
                          employeeDetailBloc.add(BackToHomeNavigateEvent());
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          right: 12,
                        ),
                        child: IconButton(
                          onPressed: () {
                            employeeDetailBloc
                                .add(EditEmployeeDetailsButtonClickedEvent());
                          },
                          icon: const Icon(
                            Icons.edit_square,
                            color: Color(0XFF556080),
                            size: 40,
                          ),
                        ),
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
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/Profile Picture.png',
                        height: 113,
                        width: 113,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '12',
                        //employee.id.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.6,
                          color: Color(0XFFDFEAF0),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const Text(
                        'Rasin Chungath',
                        //'${employee.empFirstName} ${employee.empLastName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.6,
                          color: Color(0XFFDFEAF0),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomText(
                        text: 'Male',
                        // employee.empGender.name,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomText(
                        text: '24-03-1995',
                        // employee.empDateOfBirth,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomText(
                        text: '15-05-2023',
                        //employee.empDateOfJoining,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomText(
                        text: '8157908762',
                        //employee.empPhoneNumber,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomText(
                        text: 'rasincrazz@gmail.com',
                        //text: employee.empEmailId,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: 'Chungath house'
                              //'${employee.empHomeAddrLine1},'
                              ),
                          CustomText(
                            text: 'Perumparamba',
                            //employee.empHomeAddrLine2
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Edappal',
                            //'${employee.empHomeAddrStreet},'
                          ),
                          CustomText(
                            text: 'Malappuram',
                            //'${employee.empHomeAddrDistrict},'
                          ),
                          CustomText(
                            text: 'Kerala',
                            //employee.empHomeAddrState
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'India',
                            //${employee.empHomeAddrCountry} ,
                          ),
                          CustomText(
                            text: 'Kerala',
                            // employee.empHomeAddrPinCode
                          ),
                        ],
                      ),
                      EditButton(
                        onPressed: () {
                          employeeDetailBloc
                              .add(EditEmployeeDetailsButtonClickedEvent());
                        },
                      ),
                    ],
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
