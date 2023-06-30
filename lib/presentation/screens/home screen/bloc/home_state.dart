part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeNavigateToEmployeeDetailPageState extends HomeState {}

class HomeSearchEmployeeState extends HomeState{}

class HomeAddEmployeeState extends HomeState{}

class HomeErrorState extends HomeState {}