import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class DashboardSearchWidget extends StatefulWidget {
  const DashboardSearchWidget({
    Key? key,
    this.leadingIcon,
    required this.label,
    required this.controller,
    this.suffixIcon,
  }) : super(key: key);
  final IconData? leadingIcon;
  final String label;
  final TextEditingController controller;
  final IconButton? suffixIcon;

  @override
  State<DashboardSearchWidget> createState() => _DashboardSearchWidgetState();
}

class _DashboardSearchWidgetState extends State<DashboardSearchWidget> {
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
    Color borderColor = ColorConstants.lightGrey;

    return Material(
      elevation: 2,
      color: ColorConstants.scaffoldBackgroundColor,
      shadowColor: ColorConstants.lightGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: TextStyleConstants.phoneNumberTextBorder,
          disabledBorder: TextStyleConstants.phoneNumberTextBorder,
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.leadingIcon,
            size: 24.r,
            color: Colors.black54,
          ),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: _focusNode.hasFocus
                ? ColorConstants.purple
                : ColorConstants.black,
          ),
          suffixIcon: widget.suffixIcon,
        ),
        controller: widget.controller,
        keyboardType: widget.label == 'Members'
            ? TextInputType.number
            : TextInputType.text,
        autofocus: false,
        onTap: (() {
          setState(() {
            _focusNode.requestFocus();
          });
        }),
        focusNode: _focusNode,
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
    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: 48,
    //   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
    //   decoration: BoxDecoration(
    //       color: ColorConstants.white,
    //       borderRadius: BorderRadius.circular(16.r),
    //       boxShadow: [
    //         BoxShadow(blurRadius: 10.r, color: borderColor),
    //       ]),
    //   //Row for search bar
    //   child: Row(
    //     children: [
    //       IconButton(
    //           onPressed: () {},
    //           icon: Icon(
    //             Icons.search,
    //             size: 24.sp,
    //           )),
    //       SizedBox(
    //           width: MediaQuery.of(context).size.width / 2,
    //           child: const TextField(
    //             decoration: InputDecoration(
    //                 label: Text('Search'), border: InputBorder.none),
    //           )),
    //       const Spacer(),
    //       SvgPicture.asset(
    //         'lib/assets/images/filter.svg',
    //         color: ColorConstants.grey,
    //       )
    //     ],
    //   ),
    // );
  }
}
