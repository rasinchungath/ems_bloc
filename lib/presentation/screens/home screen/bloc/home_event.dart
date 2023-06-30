part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeEmployeeDetailPageNavigateEvent extends HomeEvent {
  final Employee employee;
  HomeEmployeeDetailPageNavigateEvent({required this.employee});
}

class HomeAddEmployeeButtonClickedEvent extends HomeEvent {}

class HomeSearchEmployeeButtonClickedEvent extends HomeEvent {
final List<Employee> employee;
final int id;
HomeSearchEmployeeButtonClickedEvent({required this.employee, required this.id});
  
}
