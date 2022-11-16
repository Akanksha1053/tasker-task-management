import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/authentication_dataSource.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/authenticate_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/otp_authentication_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/sign_in_usecase.dart';

class AuthenticationRepositoryImpl implements AuthenticateRepository {
  final AuthenticationSource remoteDataSource;
  const AuthenticationRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserCredential>> authenticateUser(
      CreateUserParams createUserParams) async {
    return await remoteDataSource.authenticateUser(createUserParams);
  }

  @override
  Future<Either<Failure, UserCredential>> signInUser(
      SignInParams signInParams) async {
    return await remoteDataSource.signInUser(signInParams);
  }

  @override
  Future<Either<Failure, void>> otpAuthentication(
      OtpAuthenticationParams otpAuthenticationParams) async {
    return await remoteDataSource.otpAuthentication(otpAuthenticationParams);
  }
  
  
}
