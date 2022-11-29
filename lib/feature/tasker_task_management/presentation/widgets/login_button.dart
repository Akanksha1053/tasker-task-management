import 'package:flutter/material.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key, required this.text, required this.onPressed, this.icon})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.purple),
      child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyleConstants.signupButtonTextStyle),
              Icon(
                icon,
                color: ColorConstants.white,
              )
            ],
          )),
    );
  }
}
