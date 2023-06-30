import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeEmployeeDetailPageNavigateEvent>(
        homeEmployeeDetailPageNavigateEvent);
    on<HomeAddEmployeeButtonClickedEvent>(homeAddEmployeeButtonClickedEvent);
    on<HomeSearchEmployeeButtonClickedEvent>(
        homeSearchEmployeeButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeLoadingSuccessState());
  }

  FutureOr<void> homeEmployeeDetailPageNavigateEvent(
      HomeEmployeeDetailPageNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToEmployeeDetailPageState());
  }

  FutureOr<void> homeAddEmployeeButtonClickedEvent(
      HomeAddEmployeeButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeAddEmployeeState());
  }

  FutureOr<void> homeSearchEmployeeButtonClickedEvent(
      HomeSearchEmployeeButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeSearchEmployeeState());
  }
}
