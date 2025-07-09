part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

abstract class AuthActionState extends AuthState {}


//loading state
class AuthLoadingState extends AuthState {}


//signup
class SignupSuccessState extends AuthActionState {}

class SignupFailureState extends AuthActionState {
  final String error;

  SignupFailureState(this.error);
}

//otp verification
class OtpVerificationSuccessState extends AuthActionState {}

class OtpVerificationFailureState extends AuthActionState {
  final String error;

  OtpVerificationFailureState(this.error);
}



class TimerCountDownState extends AuthState {
  final int remainingTime;

  TimerCountDownState(this.remainingTime);
}
