part of 'employee_detail_bloc.dart';

@immutable
abstract class EmployeeDetailEvent {}

class BackToHomeNavigateEvent extends EmployeeDetailEvent{}

class EditEmployeeDetailsButtonClickedEvent extends EmployeeDetailEvent{}




