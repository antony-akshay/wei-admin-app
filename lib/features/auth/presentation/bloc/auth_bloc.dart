import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wei_admin/features/auth/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AdminSignupButtonClickedEvent>(adminSignupButtonClickedEvent);
    on<OrganizationSignupButtonClickedEvent>(
      organizationSignupButtonClickedEvent,
    );
  }

  FutureOr<void> adminSignupButtonClickedEvent(
    AdminSignupButtonClickedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 3), () {});
  final bool? signupSuccess =  await AuthRepo.adminSignup(
      event.fullName,
      event.email,
      event.contactNumber,
      event.password,
    );
    if (signupSuccess == true) {
      emit(SignupSuccessState());
    } else {
      emit(SignupFailureState("Signup failed!"));
    }
  }

  FutureOr<void> organizationSignupButtonClickedEvent(
    OrganizationSignupButtonClickedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 3), () {});
    final bool? signupSuccess = await AuthRepo.organizationSignup(
      event.organizationName,
      event.email,
      event.contactNumber,
      event.password,
      event.organizationType,
      event.address,
    );
    if (signupSuccess == true) {
      emit(SignupSuccessState());
    } else {
      emit(SignupFailureState(""));
    }
  }
}
