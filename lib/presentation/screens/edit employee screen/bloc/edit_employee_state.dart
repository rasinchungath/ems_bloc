part of 'edit_employee_bloc.dart';

@immutable
abstract class EditEmployeeState {}

class EditEmployeeInitialState extends EditEmployeeState {}

class BackToPreviousPageState extends EditEmployeeState {}

class SaveEditedEmployeeDetailsState extends EditEmployeeState {}

class EditEmployeeTextFieldInitialState extends EditEmployeeState {
  final EmployeeTextField employeeText;
  EditEmployeeTextFieldInitialState({required this.employeeText});
}

class SavedEditedEmployeeSuccessState extends EditEmployeeState {}

class SavedEditedEmployeeFailedState extends EditEmployeeState {}
