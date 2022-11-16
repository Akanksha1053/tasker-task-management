import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/choose_plan_widget.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({super.key});

  @override
  State<ChoosePlanScreen> createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          TextConstants.choosePlanTitleText,
          style: TextStyleConstants.appbarTitleTextStyle,
        ),
        // automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            TextConstants.choosePlanTitleText,
            style: TextStyleConstants.headlineTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(TextConstants.choosePlanBodyText,
              style: TextStyleConstants.bodyTextStyle),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              Stack(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected2) {
                        isSelected2 = !isSelected2;
                      }
                      isSelected1 = !isSelected1;
                    });
                  },
                  child: Container(
                    height: 210.h,
                    width: 156.w,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected1
                          ? ColorConstants.purple
                          : ColorConstants.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: const [
                        BoxShadow(
                            color: ColorConstants.lightGrey, blurRadius: 10)
                      ],
                    ),
                    child: ChoosePlanWidget(
                      emoji: "🥳",
                      planTypeText: TextConstants.choosePlanItsFreeText,
                      planDetailText: TextConstants.choosePlanFreeMemberText,
                      planTypeTextStyle: isSelected1
                          ? TextStyleConstants.selectedContainerTextStyle
                          : TextStyleConstants.headlineTextStyle,
                    ),
                  ),
                )
              ]),
              const Spacer(),
              Stack(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected1) {
                        isSelected1 = !isSelected1;
                      }
                      isSelected2 = !isSelected2;
                    });
                  },
                  child: Container(
                    height: 210.h,
                    width: 156.w,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected2
                          ? ColorConstants.purple
                          : ColorConstants.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: const [
                        BoxShadow(
                            color: ColorConstants.lightGrey, blurRadius: 10)
                      ],
                    ),
                    child: ChoosePlanWidget(
                      emoji: "🎉",
                      planTypeText: TextConstants.choosePlanPremiumText,
                      planDetailText: TextConstants.choosePlanPremiumPriceText,
                      planTypeTextStyle: isSelected2
                          ? TextStyleConstants.selectedContainerTextStyle
                          : TextStyleConstants.choosePremiumTextStyle,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          const Spacer(),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: ColorConstants.purple),
            child: TextButton(
                style: TextStyleConstants.getStartedButtonStyle,
                onPressed: () {
                  if (isSelected1 || isSelected2) {
                    AutoRouter.of(context).popUntilRoot();
                    AutoRouter.of(context).push(const DashboardScreenRoute());
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TextConstants.continueButtonText,
                        style: TextStyleConstants.signupButtonTextStyle),
                    SizedBox(
                      width: 8.w,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20.sp,
                      color: ColorConstants.white,
                    )
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
