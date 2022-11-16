
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/core/usecases/usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';


class SignInUserUsecase implements UseCase<void, SignInParams> {
  final AuthenticateRepository authenticateRepository;

  const SignInUserUsecase({required this.authenticateRepository});
  @override
  Future<Either<Failure, void>> call(SignInParams params) async {
    return await authenticateRepository.signInUser(
        SignInParams(email: params.email, password: params.password));
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;
  const SignInParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
