import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/employees_repo.dart';
import '../../../../domain/models/employee_model.dart';
import '../../../../domain/use cases/check_reg_email_or_phone.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  AddEmployeeBloc() : super(AddEmployeeInitial()) {
    on<PreviousPagePopEvent>(previousPagePopEvent);
    on<SaveNewEmployeeDetailsEvent>(saveNewEmployeeDetailsEvent);
  }

  FutureOr<void> previousPagePopEvent(
      PreviousPagePopEvent event, Emitter<AddEmployeeState> emit) {
    emit(PreviousPagePopState());
  }

  FutureOr<void> saveNewEmployeeDetailsEvent(
    SaveNewEmployeeDetailsEvent event,
    Emitter<AddEmployeeState> emit,
  ) async {
    List<Employee> employees = await EmployeesRepo().getEmployeesDetails();
    int response =
        await RegEmailOrPhone().addEmployee(event.employee, employees);
    if (response == 201) {
      emit(SavedNewEmployeeSuccessState());
    } else {
      emit(SaveNewEmployeeFailedState());
    }
  }
}
