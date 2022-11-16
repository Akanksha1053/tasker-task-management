part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessfulState extends SignInState {}

class SignInFailure extends SignInState {
  final String message;
  const SignInFailure({required this.message});
}
