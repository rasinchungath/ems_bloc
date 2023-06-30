part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeEvent {}

class PreviousPagePopEvent extends AddEmployeeEvent{}

class SaveNewEmployeeDetailsEvent extends AddEmployeeEvent{}