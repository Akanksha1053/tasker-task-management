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
      ..registerFactory((c) => CreateUserUsecase(
          authenticateRepository: c<AuthenticateRepository>()))
      ..registerFactory((c) => SignInUserUsecase(
          authenticateRepository: c<AuthenticateRepository>()))
      ..registerFactory<AuthenticateRepository>((c) =>
          AuthenticationRepositoryImpl(
              remoteDataSource: c<AuthenticationSource>()))
      ..registerFactory<AuthenticationSource>(
          (c) => FireBaseAuthenticationSourceImpl());
  }
}
