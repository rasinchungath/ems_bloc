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
  HomeSearchEmployeeButtonClickedEvent(
      {required this.employee, required this.id});
}

class HomeDeleteEmployeeButtonClickedEvent extends HomeEvent {
  final int id;
  HomeDeleteEmployeeButtonClickedEvent({required this.id});
}

class HomeDeleteEvent extends HomeEvent {
  final int id;
  HomeDeleteEvent({required this.id});
}
