import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';

class MemberProfileViewWidget extends StatelessWidget {
  const MemberProfileViewWidget({
    Key? key,
    required this.listData,
  }) : super(key: key);
  final List<Widget> listData;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
        color: ColorConstants.scaffoldBackgroundColor,
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: listData[index],
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: InkWell(
                    onTap: () {
                      AutoRouter.of(context)
                          .push(const GetAllMemberScreenRoute());
                    },
                    child: SvgPicture.asset(
                      'lib/assets/images/_Plus.svg',
                      height: 50,
                      width: 50,
                    )),
              ),
            ],
          ),
        ));
  }
}
