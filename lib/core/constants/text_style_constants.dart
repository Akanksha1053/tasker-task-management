import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';

class TextStyleConstants {
  static TextStyle loreIpsumTextStyle =
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w900);
  static TextStyle skipTextStyle = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w500, color: ColorConstants.grey);
  static TextStyle onboardingTextStyle = TextStyle(fontSize: 18.sp);
  static ButtonStyle getStartedButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorConstants.purple),
      foregroundColor: MaterialStateProperty.all(ColorConstants.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      )));
  static TextStyle getStartedButtonTextStyle = TextStyle(fontSize: 18.sp);
  static TextStyle alreadyHaveAnAccountTextStyle = TextStyle(
      fontSize: 15.sp, color: ColorConstants.grey, fontWeight: FontWeight.bold);
  static TextStyle signInTextStyle =
      TextStyle(fontSize: 15.sp, color: ColorConstants.orange);
  static const signUpHeadTextStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle signupButtonTextStyle = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      color: ColorConstants.white);
  static TextStyle orSignUpWithTextStyle = TextStyle(
      fontSize: 15.sp, color: ColorConstants.grey, fontWeight: FontWeight.bold);

  static TextStyle registeredSuccessfullyTextStyle = TextStyle(
      fontSize: 15.sp,
      color: ColorConstants.green,
      fontWeight: FontWeight.bold);
  static TextStyle forgotPasswordTextStyle =
      TextStyle(fontSize: 15.sp, color: ColorConstants.black);
  static TextStyle appbarTitleTextStyle = TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: ColorConstants.black);
  static TextStyle bodyTextStyle = TextStyle(
      fontSize: 15.sp, color: ColorConstants.grey, fontWeight: FontWeight.w300);
  static OutlineInputBorder phoneNumberTextBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      borderSide: const BorderSide(color: ColorConstants.purple));
  static TextStyle headlineTextStyle = TextStyle(
      fontSize: 15.sp,
      color: ColorConstants.black,
      fontWeight: FontWeight.bold);
  static TextStyle choosePremiumTextStyle = TextStyle(
      fontSize: 15.sp,
      color: ColorConstants.orange,
      fontWeight: FontWeight.bold);
  static TextStyle selectedContainerTextStyle = TextStyle(
      fontSize: 15.sp,
      color: ColorConstants.white,
      fontWeight: FontWeight.bold);
  static TextStyle projectNameTextStyle = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: ColorConstants.black);
}
