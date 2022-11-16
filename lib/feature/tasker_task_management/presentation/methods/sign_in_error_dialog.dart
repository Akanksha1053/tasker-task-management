import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/signin_bloc/sign_in_bloc.dart';

void showErrorDialogSignIn(BuildContext context, SignInFailure state) {
  return SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    showDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: AlertDialog(
          scrollable: true,
          backgroundColor: ColorConstants.purple,
          content: Text(state.message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                AutoRouter.of(context).pop();

                BlocProvider.of<SignInBloc>(context).add(SignInResetEvent());
              },
            )
          ],
        ),
      ),
    );
  });
}
