import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/authenticate_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/otp_authentication_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateRepository authenticateRepository;
  AuthenticationBloc(this.authenticateRepository) : super(InitialState()) {
    on<CreateUserEvent>((event, emit) async {
      emit(LoadingState());
      final getAuthStatus = await authenticateRepository.authenticateUser(
          CreateUserParams(email: event.email, password: event.password));
      getAuthStatus.fold(
          (error) => emit(AuthenticationFailure(message: error.message)),
          (r) => emit(SuccessfulState()));
    });

    on<AuthenticationResetEvent>((event, emit) {
      emit(InitialState());
    });
    on<OtpAuthenticationEvent>((event, emit) async {
      final getOtpAuthStatus = await authenticateRepository.otpAuthentication(
          OtpAuthenticationParams(phoneNumber: event.phoneNumber));
      getOtpAuthStatus.fold(
          (error) => emit(AuthenticationFailure(message: error.message)),
          (r) => emit(OtpAuthenticationSuccessState()));
    });
  }
}
