import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class CredentialFormField extends StatefulWidget {
  CredentialFormField(
      {super.key,
      required this.iconLeading,
      this.suffixIcon,
      required this.label,
      required this.controller});
  final IconData iconLeading;
  IconData? suffixIcon;
  final String label;
  final TextEditingController controller;

  @override
  State<CredentialFormField> createState() => _CredentialFormFieldState();
}

class _CredentialFormFieldState extends State<CredentialFormField> {
  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.label == 'email';
    bool isObscure = !isPassword;
    return Material(
      elevation: 2,
      shadowColor: ColorConstants.lightGrey,
      color: ColorConstants.scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(16.r),
      child: TextFormField(
        decoration: InputDecoration(
            focusedBorder: TextStyleConstants.phoneNumberTextBorder,
            prefixIcon: Icon(
              widget.iconLeading,
              size: 24.r,
              color: Colors.black54,
            ),
            hintText: widget.label,
            suffixIcon: IconButton(
              icon: Icon(widget.suffixIcon),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
            border: InputBorder.none),
        controller: widget.controller,
        autofocus: true,
        focusNode: _focusNode,
        obscureText: isObscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please provide ${widget.label}.';
          }
          return null;
        },
      ),
    );
  }
}
