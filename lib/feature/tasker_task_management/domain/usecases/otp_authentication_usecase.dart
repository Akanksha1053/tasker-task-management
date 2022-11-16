import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/core/usecases/usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';

class OtpAuthenticationUsecase {
  final AuthenticateRepository authenticateRepository;

  const OtpAuthenticationUsecase({required this.authenticateRepository});
  @override
  Future<Either<Failure, void>> otpUseCases(
      OtpAuthenticationParams params) async {
    return await authenticateRepository.otpAuthentication(
        OtpAuthenticationParams(phoneNumber: params.phoneNumber));
  }

}

class OtpAuthenticationParams extends Equatable {
  final String phoneNumber;

  const OtpAuthenticationParams({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}


