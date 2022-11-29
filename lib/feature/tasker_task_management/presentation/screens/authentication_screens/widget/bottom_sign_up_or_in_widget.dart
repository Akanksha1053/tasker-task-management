import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SignUpOrInOption extends StatelessWidget {
  const SignUpOrInOption(
      {Key? key,
      required this.buttonText,
      required this.buttonTextStyle,
      required this.route,
      required this.staticText,
      required this.staticTextStyle})
      : super(key: key);

  final String staticText;
  final TextStyle staticTextStyle;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(staticText, style: staticTextStyle),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(route);
              },
              child: Text(
                buttonText,
                style: buttonTextStyle,
              ))
        ],
      ),
    );
  }
}
