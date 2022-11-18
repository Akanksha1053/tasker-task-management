import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  String currentText = "";
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.white,
        iconTheme: const IconThemeData(color: ColorConstants.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 4,
                image: const AssetImage(
                  'lib/assets/images/otp_screen.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text(
                  TextConstants.enterOtpText,
                  style: TextStyleConstants.appbarTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text(
                  TextConstants.enterOtpScreenText,
                  style: TextStyleConstants.bodyTextStyle,
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    pastedTextStyle: const TextStyle(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (currentText.length < 3 || currentText == '1234') {
                        hasError = true;
                        return "Enter valid OTP";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 60,
                      fieldWidth: 40,
                      errorBorderColor: Colors.red,
                      selectedFillColor: ColorConstants.white,
                      selectedColor: ColorConstants.purple,
                      activeFillColor: Colors.white,
                      inactiveColor: ColorConstants.lightGrey,
                      inactiveFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    enableActiveFill: true,
                    animationDuration: const Duration(milliseconds: 300),
                    errorAnimationController: errorController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
              ),
              LoginButton(
                  text: TextConstants.nextButtonText,
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(const ResetPasswordScreenRoute());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
