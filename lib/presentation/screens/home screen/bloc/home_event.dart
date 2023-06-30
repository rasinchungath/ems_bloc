part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeEmployeeDetailPageNavigateEvent extends HomeEvent {}

class HomeAddEmployeeButtonClickedEvent extends HomeEvent {}

class HomeSearchEmployeeButtonClickedEvent extends HomeEvent {}
