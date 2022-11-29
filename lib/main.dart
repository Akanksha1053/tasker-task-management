import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/di/di.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/get_all_members/get_all_members_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/page_view_bloc/page_view_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/project_bloc/project_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/workspace_bloc/workspace_bloc.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final AppRouter appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<PageViewBloc>(
                create: (BuildContext context) =>
                    kiwi.KiwiContainer().resolve<PageViewBloc>(),
              ),
              BlocProvider<AuthenticationBloc>(
                  create: (BuildContext context) =>
                      kiwi.KiwiContainer().resolve<AuthenticationBloc>()),
              BlocProvider<SignInBloc>(
                  create: (BuildContext context) =>
                      kiwi.KiwiContainer().resolve<SignInBloc>()),
              BlocProvider<BottomNavigationBloc>(
                  create: (BuildContext context) =>
                      kiwi.KiwiContainer().resolve<BottomNavigationBloc>()),
              BlocProvider<WorkspaceBloc>(
                  create: (BuildContext context) =>
                      kiwi.KiwiContainer().resolve<WorkspaceBloc>()),
              BlocProvider<ProjectBloc>(
                create: (BuildContext context) =>
                    kiwi.KiwiContainer().resolve<ProjectBloc>(),
              ),
              BlocProvider<GetAllMembersBloc>(
                create: (BuildContext context) =>
                    kiwi.KiwiContainer().resolve<GetAllMembersBloc>(),
              ),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationParser: appRouter.defaultRouteParser(),
              routerDelegate: appRouter.delegate(),
            ),
          );
        });
  }
}
