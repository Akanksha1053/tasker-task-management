import 'package:kiwi/kiwi.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/authentication_dataSource.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/api_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/firestore_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/repository_impl/authenticate_repo_impl.dart';
import 'package:task_management/feature/tasker_task_management/data/repository_impl/fetch_member_repo_impl.dart';
import 'package:task_management/feature/tasker_task_management/data/repository_impl/project_repository_impl.dart';
import 'package:task_management/feature/tasker_task_management/data/repository_impl/workspace_repository_impl.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/authenticate_repo.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/member_repository.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/project_repository.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/workspace_repository.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/authenticate_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/fetch_members_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/project_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/sign_in_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/workspace_usecase.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/get_all_members/get_all_members_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/page_view_bloc/page_view_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/project_bloc/project_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/workspace_bloc/workspace_bloc.dart';

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
  @Register.factory(WorkspaceBloc)
  @Register.factory(ProjectBloc)
  @Register.factory(GetAllMembersBloc)
  @Register.factory(CreateUserUsecase)
  @Register.factory(SignInUserUsecase)
  @Register.factory(WorkspaceUseCase)
  @Register.factory(ProjectUseCase)
  @Register.factory(MemberUsecase)
  @Register.factory(AuthenticateRepository, from: AuthenticationRepositoryImpl)
  @Register.factory(ProjectRepository, from: ProjectRepositoryImpl)
  @Register.factory(MemberRepository,
      from: MemberRepositoryImpl)
  @Register.factory(WorkspaceRepository, from: WorkspaceRepositoryImpl)
  @Register.factory(AuthenticationSource,
      from: FireBaseAuthenticationSourceImpl)
  @Register.factory(FireStoreDataSource, from: FireStoreDataSourceImpl)
  @Register.factory(ApiDataSource, from: ApiDataSourceImplementation)
  void _configure();
}
