// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../feature/tasker_task_management/presentation/screens/authentication_screens/screens/forgot_screen.dart'
    as _i4;
import '../../feature/tasker_task_management/presentation/screens/authentication_screens/screens/otp_screen.dart'
    as _i5;
import '../../feature/tasker_task_management/presentation/screens/authentication_screens/screens/reset_password_screen.dart'
    as _i6;
import '../../feature/tasker_task_management/presentation/screens/authentication_screens/screens/sign_in_screen.dart'
    as _i2;
import '../../feature/tasker_task_management/presentation/screens/authentication_screens/screens/signup_screen.dart'
    as _i3;
import '../../feature/tasker_task_management/presentation/screens/choose_plan_screen/choose_plan_screen.dart'
    as _i8;
import '../../feature/tasker_task_management/presentation/screens/create_workspace_screen.dart'
    as _i7;
import '../../feature/tasker_task_management/presentation/screens/dashboard_screen/screen/dashboard_screen.dart'
    as _i9;
import '../../feature/tasker_task_management/presentation/screens/onboarding_screen/onboarding_screen1.dart'
    as _i1;
import '../../feature/tasker_task_management/presentation/screens/project_detail_screen/project_detail_screen.dart'
    as _i10;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    OnboardingScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingScreen(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignInScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpScreen(),
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
      );
    },
    OtpScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OtpScreen(),
      );
    },
    ResetPasswordScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ResetPasswordScreen(),
      );
    },
    CreateWorkspaceScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CreateWorkspaceScreen(),
      );
    },
    ChoosePlanScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ChoosePlanScreen(),
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DashboardScreen(),
      );
    },
    ProjectDetailScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ProjectDetailScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          OnboardingScreenRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          SignInScreenRoute.name,
          path: '/sign-in-screen',
        ),
        _i11.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        ),
        _i11.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i11.RouteConfig(
          OtpScreenRoute.name,
          path: '/otp-screen',
        ),
        _i11.RouteConfig(
          ResetPasswordScreenRoute.name,
          path: '/reset-password-screen',
        ),
        _i11.RouteConfig(
          CreateWorkspaceScreenRoute.name,
          path: '/create-workspace-screen',
        ),
        _i11.RouteConfig(
          ChoosePlanScreenRoute.name,
          path: '/choose-plan-screen',
        ),
        _i11.RouteConfig(
          DashboardScreenRoute.name,
          path: '/dashboard-screen',
        ),
        _i11.RouteConfig(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreenRoute extends _i11.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(
          OnboardingScreenRoute.name,
          path: '/',
        );

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInScreenRoute extends _i11.PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: '/sign-in-screen',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpScreenRoute extends _i11.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i11.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i5.OtpScreen]
class OtpScreenRoute extends _i11.PageRouteInfo<void> {
  const OtpScreenRoute()
      : super(
          OtpScreenRoute.name,
          path: '/otp-screen',
        );

  static const String name = 'OtpScreenRoute';
}

/// generated route for
/// [_i6.ResetPasswordScreen]
class ResetPasswordScreenRoute extends _i11.PageRouteInfo<void> {
  const ResetPasswordScreenRoute()
      : super(
          ResetPasswordScreenRoute.name,
          path: '/reset-password-screen',
        );

  static const String name = 'ResetPasswordScreenRoute';
}

/// generated route for
/// [_i7.CreateWorkspaceScreen]
class CreateWorkspaceScreenRoute extends _i11.PageRouteInfo<void> {
  const CreateWorkspaceScreenRoute()
      : super(
          CreateWorkspaceScreenRoute.name,
          path: '/create-workspace-screen',
        );

  static const String name = 'CreateWorkspaceScreenRoute';
}

/// generated route for
/// [_i8.ChoosePlanScreen]
class ChoosePlanScreenRoute extends _i11.PageRouteInfo<void> {
  const ChoosePlanScreenRoute()
      : super(
          ChoosePlanScreenRoute.name,
          path: '/choose-plan-screen',
        );

  static const String name = 'ChoosePlanScreenRoute';
}

/// generated route for
/// [_i9.DashboardScreen]
class DashboardScreenRoute extends _i11.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: '/dashboard-screen',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i10.ProjectDetailScreen]
class ProjectDetailScreenRoute extends _i11.PageRouteInfo<void> {
  const ProjectDetailScreenRoute()
      : super(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
        );

  static const String name = 'ProjectDetailScreenRoute';
}
