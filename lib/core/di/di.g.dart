// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => PageViewBloc())
      ..registerFactory((c) => SignInBloc(c<AuthenticateRepository>()))
      ..registerFactory((c) => BottomNavigationBloc())
      ..registerFactory((c) => AuthenticationBloc(c<AuthenticateRepository>()))
      ..registerFactory((c) => WorkspaceBloc(c<WorkspaceUseCase>()))
      ..registerFactory((c) => ProjectBloc(c<ProjectUseCase>()))
      ..registerFactory((c) => GetAllMembersBloc(c<MemberUsecase>()))
      ..registerFactory((c) => CreateUserUsecase(
          authenticateRepository: c<AuthenticateRepository>()))
      ..registerFactory((c) => SignInUserUsecase(
          authenticateRepository: c<AuthenticateRepository>()))
      ..registerFactory((c) =>
          WorkspaceUseCase(workspaceRepository: c<WorkspaceRepository>()))
      ..registerFactory(
          (c) => ProjectUseCase(projectRepository: c<ProjectRepository>()))
      ..registerFactory(
          (c) => MemberUsecase(memberRepository: c<MemberRepository>()))
      ..registerFactory<AuthenticateRepository>((c) =>
          AuthenticationRepositoryImpl(
              remoteDataSource: c<AuthenticationSource>()))
      ..registerFactory<ProjectRepository>((c) =>
          ProjectRepositoryImpl(fireStoreDataSource: c<FireStoreDataSource>()))
      ..registerFactory<MemberRepository>((c) => MemberRepositoryImpl(
          c<FireStoreDataSource>(),
          apiDataSource: c<ApiDataSource>()))
      ..registerFactory<WorkspaceRepository>((c) => WorkspaceRepositoryImpl(
          fireStoreDataSource: c<FireStoreDataSource>()))
      ..registerFactory<AuthenticationSource>(
          (c) => FireBaseAuthenticationSourceImpl())
      ..registerFactory<FireStoreDataSource>((c) => FireStoreDataSourceImpl())
      ..registerFactory<ApiDataSource>((c) => ApiDataSourceImplementation());
  }
}
