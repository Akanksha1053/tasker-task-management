import 'package:task_management/feature/tasker_task_management/presentation/screens/choose_plan_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_workspace_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/forgot_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/onboarding_screen1.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/otp_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/reset_password_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/sign_in_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/signup_screen.dart';
import 'package:auto_route/auto_route.dart';
@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: OnboardingScreen, initial: true),
  AutoRoute(page: SignInScreen),
  AutoRoute(page: SignUpScreen),
  AutoRoute(page: ForgotPasswordScreen),
  AutoRoute(page: OtpScreen),
  AutoRoute(page: ResetPasswordScreen),
  AutoRoute(page: CreateWorkspaceScreen),
  AutoRoute(page: ChoosePlanScreen),
  AutoRoute(page: DashboardScreen)
])
class $AppRouter {}
