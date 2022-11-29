import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/screens/forgot_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/screens/otp_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/screens/reset_password_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/screens/sign_in_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/screens/signup_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/choose_plan_screen/choose_plan_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/get_all_members_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/workspace_screen/create_workspace_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/screen/dashboard_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/screens/project_detail_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/workspace_screen/get_workspace_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: OnboardingScreen, initial: true),
  AutoRoute(page: SignInScreen),
  AutoRoute(page: SignUpScreen),
  AutoRoute(page: ForgotPasswordScreen),
  AutoRoute(page: OtpScreen),
  AutoRoute(page: ResetPasswordScreen),
  AutoRoute(page: CreateWorkspaceScreen),
  AutoRoute(page: ChoosePlanScreen),
  AutoRoute(page: DashboardScreen),
  AutoRoute(page: ProjectDetailScreen),
  AutoRoute(page: GetWorkspaceScreen),
  AutoRoute(page: GetAllMemberScreen)
])
class $AppRouter {}
