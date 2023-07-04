import 'package:ems_bloc/domain/models/employee_model.dart';
import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';

class ListTileWidget extends StatelessWidget {
  final HomeBloc homebloc;
  final Employee employee;
  final VoidCallback onLongPressed;
  const ListTileWidget({
    super.key,
    required this.homebloc,
    required this.employee,
    required this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 7,
      onTap: () {
        homebloc.add(
          HomeEmployeeDetailPageNavigateEvent(
            employee: employee,
          ),
        );
      },
      onLongPress: onLongPressed,
      leading: Image.asset(
        'assets/images/Profile Picture 1.png',
        height: 32,
        width: 32,
      ),
      title: Text(
        employee.empFirstName,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Color(0XFF41485F),
        ),
      ),
    );
  }
}
