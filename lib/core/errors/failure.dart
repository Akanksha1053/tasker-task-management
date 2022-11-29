import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class InsertionFailure extends Failure {
  const InsertionFailure({required String message}) : super(message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({required String message}) : super(message);
}

class SignInFailure extends Failure {
  const SignInFailure({required String message}) : super(message);
}

class CreateFailure extends Failure {
  const CreateFailure({required String message}) : super(message);
}

class FetchFailure extends Failure {
  const FetchFailure({required String message}) : super(message);
}
