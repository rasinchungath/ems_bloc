part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  HomeLoadingSuccessState({required this.employees});
  final List<Employee> employees;
}

class HomeNavigateToEmployeeDetailPageState extends HomeState {
  final Employee employee;
  HomeNavigateToEmployeeDetailPageState({required this.employee});
}

class HomeSearchEmployeeState extends HomeState {
  final List<Employee> employees;
  final Employee employee;
  HomeSearchEmployeeState({
    required this.employee,
    required this.employees,
  });
}

class HomeAddEmployeeState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeSearchEmployeeUnavailableState extends HomeState {}
