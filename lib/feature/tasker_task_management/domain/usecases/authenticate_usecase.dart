import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/core/usecases/usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';

class CreateUserUsecase implements UseCase<void, CreateUserParams> {
  final AuthenticateRepository authenticateRepository;

  const CreateUserUsecase({required this.authenticateRepository});
  @override
  Future<Either<Failure, void>> call(CreateUserParams params) async {
    return await authenticateRepository.authenticateUser(
        CreateUserParams(email: params.email, password: params.password));
  }
}

class CreateUserParams extends Equatable {
  final String email;
  final String password;
  const CreateUserParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
