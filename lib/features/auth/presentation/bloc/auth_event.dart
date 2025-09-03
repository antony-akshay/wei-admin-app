part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AdminSignupButtonClickedEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String contactNumber;
  final String password;

  AdminSignupButtonClickedEvent({
    required this.fullName,
    required this.email,
    required this.contactNumber,
    required this.password,
  });
}

class OrganizationSignupButtonClickedEvent extends AuthEvent {
  final String organizationName;
  final String email;
  final String contactNumber;
  final String password;
  final String organizationType;
  final String address;

  OrganizationSignupButtonClickedEvent({
    required this.organizationType,
    required this.address,
    required this.organizationName,
    required this.email,
    required this.contactNumber,
    required this.password,
  });
}

class StartTimerEvent extends AuthEvent {
  final int initialDuration;

  StartTimerEvent({required this.initialDuration});
}

class LoginButtonClickedEvent extends AuthEvent{
  final String identifier;
  final String pw;

  LoginButtonClickedEvent({required this.identifier, required this.pw});
}

class VerifyOtpButtonClickedEvent extends AuthEvent {
  final String email;
  final String contactNumber;
  final String otp;

  VerifyOtpButtonClickedEvent({
    required this.email,
    required this.contactNumber,
    required this.otp,
  });
}


class ForgotPasswordSendclickedEvent extends AuthEvent {
  final String identifier;

  ForgotPasswordSendclickedEvent({
    required this.identifier,
  });
}

class OtpVerifyButtonClickedEvent extends AuthEvent{
  final String pin;
  final String email;

  OtpVerifyButtonClickedEvent({
    //contact?
    required this.email,
    required this.pin,
  });
}

class resetPasswordButtonClickedEvent extends AuthEvent{
  final String pw;
  final String userId;

  resetPasswordButtonClickedEvent({
    //contact?
    required this.pw,
    required this.userId,
  });
}