import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'employee_detail_event.dart';
part 'employee_detail_state.dart';

class EmployeeDetailBloc
    extends Bloc<EmployeeDetailEvent, EmployeeDetailState> {
  EmployeeDetailBloc() : super(EmployeeDetailInitial()) {
    on<BackToHomeNavigateEvent>(backToHomeNavigateEvent);
    on<EditEmployeeDetailsButtonClickedEvent>(
        editEmployeeDetailsButtonClickedEvent);
  }

  FutureOr<void> backToHomeNavigateEvent(
      BackToHomeNavigateEvent event, Emitter<EmployeeDetailState> emit) {
    emit(BackToHomeNavigateState());
  }

  FutureOr<void> editEmployeeDetailsButtonClickedEvent(
      EditEmployeeDetailsButtonClickedEvent event,
      Emitter<EmployeeDetailState> emit) {
    emit(EditEmployeeDetailState());
  }
}
