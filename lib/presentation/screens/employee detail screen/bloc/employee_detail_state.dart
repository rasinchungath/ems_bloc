part of 'employee_detail_bloc.dart';

@immutable
abstract class EmployeeDetailState {}

class EmployeeDetailInitial extends EmployeeDetailState {}

class BackToHomeNavigateState extends EmployeeDetailState{}

class EditEmployeeDetailState extends EmployeeDetailState{}

