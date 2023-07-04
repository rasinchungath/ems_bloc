part of 'edit_employee_bloc.dart';

@immutable
abstract class EditEmployeeEvent {}

class EditEmployeeInitialEvent extends EditEmployeeEvent {
  final Employee employee;
  EditEmployeeInitialEvent({required this.employee});
}

class BackToPreviousPageEvent extends EditEmployeeEvent {}

class SaveEditedEmployeeDetailsEvent extends EditEmployeeEvent {
  final Employee employee;
  SaveEditedEmployeeDetailsEvent({required this.employee});
}

class EditEmployeeFailedEvent extends EditEmployeeEvent{}
