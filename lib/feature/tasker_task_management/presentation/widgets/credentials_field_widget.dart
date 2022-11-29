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
  final IconData? iconLeading;
  IconData? suffixIcon;
  final String? label;
  final TextEditingController? controller;

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
    final isPassword =
        (widget.label == 'Password' || widget.label == 'Confirm Password');
    bool isObscure = isPassword;
    return Material(
      elevation: 2,
      color: ColorConstants.scaffoldBackgroundColor,
      shadowColor: ColorConstants.lightGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: TextStyleConstants.phoneNumberTextBorder,
          disabledBorder: TextStyleConstants.phoneNumberTextBorder,
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.iconLeading,
            size: 24.r,
            color: Colors.black54,
          ),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: _focusNode.hasFocus
                ? ColorConstants.purple
                : ColorConstants.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(widget.suffixIcon),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
              _focusNode.requestFocus();
            },
          ),
        ),
        controller: widget.controller,
        keyboardType: widget.label == 'Members'
            ? TextInputType.number
            : TextInputType.text,
        autofocus: true,
        focusNode: _focusNode,
        obscureText: isObscure,
        cursorColor: ColorConstants.purple,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
