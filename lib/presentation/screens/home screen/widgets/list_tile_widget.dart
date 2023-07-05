import 'package:ems_bloc/domain/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constant.dart';
import '../../../../domain/use cases/first_letter_capitalize.dart';
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
    final empFirstName = ToUpperCase.toCapCase(text: employee.empFirstName);
    final empLastName = ToUpperCase.toCapCase(text: employee.empLastName);
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
      title: BlocBuilder<HomeBloc, HomeState>(
        bloc: homebloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingSuccessState:
              return Text(
                empFirstName,
                style: homeTextStyle,
              );
            case HomeSearchEmployeeState:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$empFirstName $empLastName',
                    style: homeTextStyle,
                  ),
                  Text(
                    'Sex: ${employee.empGender.name}   Emp Id: ${employee.id}',
                    style: homeTextStyle,
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
