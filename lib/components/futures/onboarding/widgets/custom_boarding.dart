// components/futures/onboarding/widgets/custom_boarding.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_hup/components/futures/onboarding/widgets/dots.dart';
import 'package:store_hup/components/futures/onboarding/widgets/startnow_button.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

class CustomBoard extends StatelessWidget {
  final String subtitel;
  final String imagepath;
  final Widget title;
  final int curnetpage;
  const CustomBoard(
      {super.key,
      required this.subtitel,
      required this.imagepath,
      required this.curnetpage,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Column(
              children: [
                SizedBox(
                  height: 0.16.sh,
                ),
                SvgPicture.asset(
                  imagepath,
                  fit: BoxFit.contain,
                  height: 0.4.sh,
                ),
                SizedBox(
                  height: 20.h,
                ),
                title,
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  subtitel,
                  textAlign: TextAlign.center,
                  style: TextsStyle.semibold13
                      .copyWith(color: AppColors.grayscale500),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DotsPage(curnetpage: curnetpage),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          StartUpButton(curnetpage: curnetpage)
        ],
      ),
    );
  }
}
