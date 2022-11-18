import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/navigation_constants.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/home_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
              color: ColorConstants.black, size: 24.r //change your color here
              ),
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.appbarBackgroundColor,
          elevation: 0,
          title: Row(
            children: [
              Text(
                TextConstants.dashboardTitleText,
                style: TextStyleConstants.appbarTitleTextStyle,
              ),
              SizedBox(
                width: 8.w,
              ),
              SvgPicture.asset('lib/assets/images/dashboard.svg'),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              height: 44.r,
              width: 44.r,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  backgroundColor: ColorConstants.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 24.r,
                  color: ColorConstants.white,
                ),
              ),
            ),
          ]),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
        if (state is BottomNavigationLoaded) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.chat) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.notification) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.settings) {
            return const HomePage();
          }
          return Container();
        } else {
          BlocProvider.of<BottomNavigationBloc>(context)
              .add(const SelectBottomNavigationEvent(NavbarItem.home, 0));
          return const Center(child: CircularProgressIndicator());
        }
      }),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationLoaded) {
            return SizedBox(
              width: 327.w,
              child: DotNavigationBar(
                items: [
                  DotNavigationBarItem(
                      icon: SvgPicture.asset(
                    'lib/assets/images/home.svg',
                    color: (state.index == 0)
                        ? ColorConstants.purple
                        : ColorConstants.grey,
                    height: 28.r,
                    width: 28.r,
                  )),
                  DotNavigationBarItem(
                      icon: SvgPicture.asset(
                    'lib/assets/images/chat.svg',
                    color: (state.index == 1)
                        ? ColorConstants.purple
                        : ColorConstants.grey,
                    height: 28.r,
                    width: 28.r,
                  )),
                  DotNavigationBarItem(
                    icon: SvgPicture.asset(
                      'lib/assets/images/notification.svg',
                      color: (state.index == 2)
                          ? ColorConstants.purple
                          : ColorConstants.grey,
                      height: 28.r,
                      width: 28.r,
                    ),
                  ),
                  DotNavigationBarItem(
                      icon: const Icon(Icons.settings_outlined))
                ],
                backgroundColor: ColorConstants.scaffoldBackgroundColor,
                selectedItemColor: ColorConstants.purple,
                unselectedItemColor: ColorConstants.grey,
                currentIndex: state.index,
                onTap: (int i) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(
                      SelectBottomNavigationEvent(NavbarItem.values[i], i));
                },
                enableFloatingNavBar: true,
                borderRadius: 16.r,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                boxShadow: [
                  BoxShadow(color: ColorConstants.lightGrey, blurRadius: 10.r)
                ],
              ),
            );
          }
          if (state is BottomNavigationInitial) {
            BlocProvider.of<BottomNavigationBloc>(context)
                .add(const SelectBottomNavigationEvent(NavbarItem.home, 0));
          }
          return Container();
        },
      ),
    );
  }
}
