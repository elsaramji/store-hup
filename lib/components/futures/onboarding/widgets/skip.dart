// components/futures/onboarding/widgets/skip.dart
import 'package:flutter/material.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../logics/logics_onBoarding_goto.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(right: 21, top: 21),
        child: Text(
          "تخط",
          style: TextsStyle.regular13.copyWith(color: AppColors.grayscale400),
        ),
      ),
    );
  }
}
