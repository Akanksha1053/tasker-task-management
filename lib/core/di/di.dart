

import 'package:kiwi/kiwi.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/authentication_dataSource.dart';
import 'package:task_management/feature/tasker_task_management/data/repository_impl/authenticate_repo_impl.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/authenticate_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/sign_in_usecase.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/page_view_bloc/page_view_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/signin_bloc/sign_in_bloc.dart';

part 'di.g.dart';

abstract class Injector {
  static KiwiContainer? container;
  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static get resolve => container!.resolve;

  @Register.factory(PageViewBloc)
  @Register.factory(SignInBloc)
  @Register.factory(BottomNavigationBloc)
  @Register.factory(AuthenticationBloc)
  @Register.factory(CreateUserUsecase)
  @Register.factory(SignInUserUsecase)
  @Register.factory(AuthenticateRepository, from: AuthenticationRepositoryImpl)
  @Register.factory(AuthenticationSource,from: FireBaseAuthenticationSourceImpl)
  void _configure();
}
