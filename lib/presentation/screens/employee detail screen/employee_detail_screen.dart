import 'package:ems_bloc/presentation/screens/edit%20employee%20screen/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/models/employee_model.dart';
import '../../../domain/use cases/first_letter_capitalize.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text.dart';
import '../home screen/home_screen.dart';
import 'bloc/employee_detail_bloc.dart';
import 'widgets/edit_button.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  EmployeeDetailsScreen({
    super.key,
    required this.employee,
  });
  final Employee employee;

  final EmployeeDetailBloc employeeDetailBloc = EmployeeDetailBloc();

  @override
  Widget build(BuildContext context) {
    final empFirstName = ToUpperCase.toCapCase(text: employee.empFirstName);
    final empLastName = ToUpperCase.toCapCase(text: employee.empLastName);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          employeeDetailBloc.add(BackToHomeNavigateEvent());
          return true;
        },
        child: Scaffold(
          appBar: customAppbar(title: 'Employee details'),
          body: BlocListener<EmployeeDetailBloc, EmployeeDetailState>(
            bloc: employeeDetailBloc,
            listener: (context, state) {
              if (state is BackToHomeNavigateState) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false);
              } else if (state is EditEmployeeDetailState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditEmployeeDetailsScreen(
                      employee: employee,
                    ),
                  ),
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(
                        onPressed: () {
                          employeeDetailBloc.add(BackToHomeNavigateEvent());
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.r,
                          right: 12.r,
                        ),
                        child: IconButton(
                          onPressed: () {
                            employeeDetailBloc
                                .add(EditEmployeeDetailsButtonClickedEvent());
                          },
                          icon: Icon(
                            Icons.edit_square,
                            color: const Color(0XFF556080),
                            size: 40.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                     height: 630.h,
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
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          'assets/images/Profile Picture.png',
                          height: 113.h,
                          width: 113.w,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          employee.id.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 0.6.sp,
                            color: const Color(0XFFDFEAF0),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Text(
                          '$empFirstName $empLastName',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 0.6,
                            color: const Color(0XFFDFEAF0),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomText(
                          text: employee.empGender.name,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomText(
                          text: employee.empDateOfBirth,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomText(
                          text: employee.empDateOfJoining,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomText(
                          text: employee.empPhoneNumber,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomText(
                          text: employee.empEmailId,
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: '${employee.empHomeAddrLine1},'),
                            CustomText(text: employee.empHomeAddrLine2),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: '${employee.empHomeAddrStreet},'),
                            CustomText(
                                text: '${employee.empHomeAddrDistrict},'),
                            CustomText(text: employee.empHomeAddrState),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '${employee.empHomeAddrCountry},',
                            ),
                            CustomText(text: employee.empHomeAddrPinCode),
                          ],
                        ),
                        EditButton(
                          onPressed: () {
                            employeeDetailBloc
                                .add(EditEmployeeDetailsButtonClickedEvent());
                          },
                        ),
                        SizedBox(height: 25.h,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
