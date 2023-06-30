import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ems_bloc/data/repositories/employees_repo.dart';
import 'package:ems_bloc/domain/models/employee_model.dart';
import 'package:ems_bloc/domain/use%20cases/search_employee.dart';
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
    List<Employee> employees = await EmployeesRepo().getEmployeesDetails();
    // Employee employee = await EmployeesRepo().getEmployeeDetails(149);
    // print(employees[1].empFirstName);
    // print(employee.empFirstName);
    emit(HomeLoadingSuccessState(employees: employees));
  }

  FutureOr<void> homeEmployeeDetailPageNavigateEvent(
      HomeEmployeeDetailPageNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToEmployeeDetailPageState(employee: event.employee));
  }

  FutureOr<void> homeAddEmployeeButtonClickedEvent(
      HomeAddEmployeeButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeAddEmployeeState());
  }

  FutureOr<void> homeSearchEmployeeButtonClickedEvent(
      HomeSearchEmployeeButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    final bool isEmpAvailable =
        SearchEmployee().isEmpAvailable(event.id, event.employee);
    if (isEmpAvailable) {
      emit(HomeLoadingState());
      final Employee employee =
          await SearchEmployee().searchEmployee(event.id, event.employee);
      emit(HomeSearchEmployeeState(
          employee: employee, employees: event.employee));
    }else{
      emit(HomeSearchEmployeeUnavailableState());
      emit(HomeLoadingSuccessState(employees: event.employee));
    }
  }
}
