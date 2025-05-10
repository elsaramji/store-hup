// features/onboarding/widgets/skip.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../core/func/logics_onBoarding_goto.dart';

class Skip extends StatelessWidget {
  const Skip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LogicsOnBoardingGoto.startnow(context);
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, top: 8.h),
          child: Text(
            "تخط",
            style: TextsStyle.regular13.copyWith(color: AppColors.grayscale400),
          ),
        ),
      ),
    );
  }
}
