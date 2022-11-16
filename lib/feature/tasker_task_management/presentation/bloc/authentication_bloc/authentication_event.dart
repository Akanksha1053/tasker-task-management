part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends AuthenticationEvent {
  final String email;
  final String password;
  const CreateUserEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class OtpAuthenticationEvent extends AuthenticationEvent {
  final String phoneNumber;
  const OtpAuthenticationEvent({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}


class AuthenticationResetEvent extends AuthenticationEvent {}
