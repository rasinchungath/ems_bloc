import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
      SaveNewEmployeeDetailsEvent event, Emitter<AddEmployeeState> emit) {
        emit(SaveNewEmployeeDetailsState());
      }
}
