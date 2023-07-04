part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeState {}

class AddEmployeeInitial extends AddEmployeeState {}

class PreviousPagePopState extends AddEmployeeState{}

class SaveNewEmployeeDetailsState extends AddEmployeeState{
  final Employee employee;
  SaveNewEmployeeDetailsState({required this.employee});
  
}
