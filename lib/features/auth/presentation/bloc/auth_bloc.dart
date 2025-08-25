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
    on<StartTimerEvent>(startTimer);
    on<VerifyOtpButtonClickedEvent>(verifyOtpButtonClickedEvent);
  }

  FutureOr<void> adminSignupButtonClickedEvent(
    AdminSignupButtonClickedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 2), () {});
    final bool? signupSuccess = await AuthRepo.adminSignup(
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
    await Future.delayed(Duration(seconds: 2), () {});
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
      emit(SignupFailureState("Signup failed!"));
    }
  }

  Future<void> startTimer(
    StartTimerEvent event,
    Emitter<AuthState> emit,
  ) async {
    int remainingTime = event.initialDuration;

    // Emit the initial timer state
    emit(TimerCountDownState(remainingTime));

    // Loop to simulate a timer
    while (remainingTime > 0) {
      await Future.delayed(const Duration(seconds: 1));

      remainingTime--;

      if (!emit.isDone) {
        emit(TimerCountDownState(remainingTime));
      } else {
        break;
      }
    }
  }

  FutureOr<void> verifyOtpButtonClickedEvent(
    VerifyOtpButtonClickedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 2), () {});
    final bool? signupSuccess = await AuthRepo.verifyOtp(
      event.email,
      event.contactNumber,
      event.otp,
    );
    if (signupSuccess == true) {
      emit(OtpVerificationSuccessState());
    } else {
      emit(OtpVerificationFailureState("Verification failed!"));
    }
  }

  Future<void> ForgotPasswordSendclicked(
    ForgotPasswordSendclickedEvent event,
    Emitter<AuthState> emit
  ) async{
    emit(ForgotPasswordLoadingState());
    await Future.delayed(Duration(seconds: 2), () {});
    final bool? otpsendSuccess = await AuthRepo.forgotPWSendIdentifer(
      event.identifier
    );
    if (otpsendSuccess == true) {
      emit(OtpSendSuccessState());
    } else {
      emit(OtpSendFailureState("otp did not send!"));
    }

  }
}
