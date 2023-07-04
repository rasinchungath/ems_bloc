part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeState {}

class AddEmployeeInitial extends AddEmployeeState {}

class PreviousPagePopState extends AddEmployeeState {}

class SavedNewEmployeeSuccessState extends AddEmployeeState {}

class SaveNewEmployeeFailedState extends AddEmployeeState {}

class SaveNewEmployeeEmailorPhoneErrorState extends AddEmployeeState {}

class SaveNewEmployeeFieldMissingErrorState extends AddEmployeeState {}
