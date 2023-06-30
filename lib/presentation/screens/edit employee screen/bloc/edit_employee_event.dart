part of 'edit_employee_bloc.dart';

@immutable
abstract class EditEmployeeEvent {}

class BackToPreviousPageEvent extends EditEmployeeEvent{}

class SaveEditedEmployeeDetailsEvent extends EditEmployeeEvent{}


