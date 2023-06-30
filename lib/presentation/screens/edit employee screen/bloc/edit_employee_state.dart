part of 'edit_employee_bloc.dart';

@immutable
abstract class EditEmployeeState {}

class EditEmployeeInitial extends EditEmployeeState {}

class BackToPreviousPageState extends EditEmployeeState{}

class SaveEditedEmployeeDetailsState extends EditEmployeeState{}


