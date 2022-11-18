import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showDialogForErrror(
    {required String message,
    required BuildContext context,
    required VoidCallback onPressed}) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    showDialog(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: AlertDialog(
          scrollable: true,
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text('OK'),
            )
          ],
        ),
      ),
      context: context,
    );
  });
}
