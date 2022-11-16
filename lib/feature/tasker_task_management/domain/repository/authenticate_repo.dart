import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/authenticate_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/otp_authentication_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/sign_in_usecase.dart';

abstract class AuthenticateRepository {
  Future<Either<Failure, UserCredential>> authenticateUser(
      CreateUserParams createUserParams);
  Future<Either<Failure, UserCredential>> signInUser(SignInParams params);

  Future<Either<Failure, void>> otpAuthentication(
      OtpAuthenticationParams otpAuthenticationParams);

  
}
