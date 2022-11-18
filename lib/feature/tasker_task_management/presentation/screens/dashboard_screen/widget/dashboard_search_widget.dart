import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';

class DashboardSearchWidget extends StatelessWidget {
  const DashboardSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 48.h,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(blurRadius: 10.r, color: ColorConstants.lightGrey),
          ]),
      //Row for search bar
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 24.sp,
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const TextField(
                decoration: InputDecoration(
                    label: Text('Search'), border: InputBorder.none),
              )),
          const Spacer(),
          SvgPicture.asset(
            'lib/assets/images/filter.svg',
            color: ColorConstants.grey,
          )
        ],
      ),
    );
  }
}
