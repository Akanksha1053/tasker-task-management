import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/navigation_constants.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
            child: Row(
              children: [
                Text(
                  TextConstants.dashboardTitleText,
                  style: TextStyleConstants.appbarTitleTextStyle,
                ),
                SizedBox(
                  width: 8.w,
                ),
                SvgPicture.asset('lib/assets/images/dashboard.svg'),
                const Spacer(),
                SizedBox(
                  height: 44.r,
                  width: 44.r,
                  // constraints:
                  //     BoxConstraints.tightFor(width: 44.r, height: 44.r),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(ColorConstants.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: ColorConstants.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
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
        ]),
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationLoaded) {
            return SizedBox(
              width: 327.w,
              child: DotNavigationBar(
                items: [
                  DotNavigationBarItem(
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                  ),
                  DotNavigationBarItem(
                    icon: const Icon(
                      Icons.chat_bubble_outline,
                    ),
                  ),
                  DotNavigationBarItem(
                    icon: const Icon(Icons.notifications_outlined),
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
