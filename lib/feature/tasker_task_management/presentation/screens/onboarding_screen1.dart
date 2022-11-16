import 'package:auto_route/auto_route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/page_view_bloc/page_view_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/onboarding_screen_widget/onboarding_page_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/onboarding_screen_widget/skip_button_text_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/bottom_sign_up_or_in_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final pages = List.generate(3, (index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100.h),
        Expanded(
            child: Image.asset(
          'lib/assets/images/onboarding_${index + 1}.png',
          scale: 1,
        )),
        SizedBox(
          height: 60.h,
        ),
        Text(
          textAlign: TextAlign.center,
          (TextConstants.loremIpsumText),
          style: TextStyleConstants.loreIpsumTextStyle,
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Text(
              textAlign: TextAlign.center,
              TextConstants.textList[index],
              style: TextStyleConstants.onboardingTextStyle),
        ),
      ],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PageViewBloc, PageViewState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorConstants.white,
            child: Column(children: <Widget>[
              OnboardingPageWidget(controller: controller, pages: pages),
              (state as PageViewInitial).index == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 15,
                            child: TextButton(
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const SignUpScreenRoute());
                              },
                              style: TextStyleConstants.getStartedButtonStyle,
                              child: Text(
                                TextConstants.getStartedButtonText,
                                style: TextStyleConstants
                                    .getStartedButtonTextStyle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SignUpOrInOption(
                            buttonText: TextConstants.signInText,
                            buttonTextStyle: TextStyleConstants.signInTextStyle,
                            route: const SignInScreenRoute(),
                            staticText: TextConstants.alreadyHaveAnAccountText,
                            staticTextStyle: TextStyleConstants
                                .alreadyHaveAnAccountTextStyle),
                      ],
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SkipButtonAndTextWidget(),
                          Column(
                            children: [
                              SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: const ExpandingDotsEffect(
                                  spacing: 8.0,
                                  radius: 10.0,
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  strokeWidth: 0.5,
                                  dotColor: ColorConstants.grey,
                                  activeDotColor: ColorConstants.purple,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
            ]),
          );
        },
      ),
    );
  }
}
