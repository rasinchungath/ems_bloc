import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ems_bloc/domain/use%20cases/fill_textfield_with_emp_details.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/employees_repo.dart';
import '../../../../domain/models/employee_model.dart';
import '../../../../domain/models/textfield_model.dart';

part 'edit_employee_event.dart';
part 'edit_employee_state.dart';

class EditEmployeeBloc extends Bloc<EditEmployeeEvent, EditEmployeeState> {
  EditEmployeeBloc() : super(EditEmployeeInitialState()) {
    on<EditEmployeeInitialEvent>(editEmployeeInitialEvent);
    on<BackToPreviousPageEvent>(backToPreviousPageEvent);
    on<SaveEditedEmployeeDetailsEvent>(saveEditedEmployeeDetailsEvent);
  }

  FutureOr<void> editEmployeeInitialEvent(
      EditEmployeeInitialEvent event, Emitter<EditEmployeeState> emit) {
    final EmployeeTextField employeeText =
        FillTextField().editEmployeeTextField(event.employee);
    emit(EditEmployeeTextFieldInitialState(employeeText: employeeText));
  }

  FutureOr<void> backToPreviousPageEvent(
      BackToPreviousPageEvent event, Emitter<EditEmployeeState> emit) {
    emit(BackToPreviousPageState());
  }

  FutureOr<void> saveEditedEmployeeDetailsEvent(
      SaveEditedEmployeeDetailsEvent event,
      Emitter<EditEmployeeState> emit) async {
    int response = await EmployeesRepo()
        .updateDetails(id: event.employee.id, employee: event.employee);
    if (response == 200) {
      emit(SaveEditedEmployeeDetailsState());
      emit(SavedEditedEmployeeSuccessState());
    } else {
      emit(SavedEditedEmployeeFailedState());
      final EmployeeTextField employeeText =
          FillTextField().editEmployeeTextField(event.employee);
      emit(EditEmployeeTextFieldInitialState(employeeText: employeeText));
    }
  }
}
