part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class SuccessfulState extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;
  const AuthenticationFailure({required this.message});
}

class OtpAuthenticationSuccessState extends AuthenticationState {}
