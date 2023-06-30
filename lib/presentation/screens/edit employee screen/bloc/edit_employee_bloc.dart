import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'edit_employee_event.dart';
part 'edit_employee_state.dart';

class EditEmployeeBloc extends Bloc<EditEmployeeEvent, EditEmployeeState> {
  EditEmployeeBloc() : super(EditEmployeeInitial()) {
    on<BackToPreviousPageEvent>(backToPreviousPageEvent);
    on<SaveEditedEmployeeDetailsEvent>(saveEditedEmployeeDetailsEvent);
  }

  FutureOr<void> backToPreviousPageEvent(
      BackToPreviousPageEvent event, Emitter<EditEmployeeState> emit) {
        emit(BackToPreviousPageState());
      }

  FutureOr<void> saveEditedEmployeeDetailsEvent(
      SaveEditedEmployeeDetailsEvent event, Emitter<EditEmployeeState> emit) {
        emit(SaveEditedEmployeeDetailsState());
      }
}
