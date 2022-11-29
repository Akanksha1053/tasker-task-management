import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticateRepository authenticateRepository;
  SignInBloc(this.authenticateRepository) : super(SignInInitialState()) {
    on<SignInUserEvent>((event, emit) async {
      emit(SignInLoadingState());
      final getAuthStatus = await authenticateRepository.signInUser(
          SignInParams(email: event.email, password: event.password));
      getAuthStatus.fold((error) => emit(SignInFailure(message: error.message)),
          (r) => emit(SignInSuccessfulState()));
    });
    on<SignInResetEvent>((event, emit) {
      emit(SignInInitialState());
    });
  }
}
