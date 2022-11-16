import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showSnackBarMethod(BuildContext context, String text, TextStyle style) {
  return SchedulerBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: style,
        ),
      ),
    );
  });
}
