// features/onboarding/widgets/startnow_button.dart

import 'package:flutter/material.dart';

import '../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../core/custom/widgets/custom_button.dart';
import '../../../../core/styles/color_style.dart';
import '../core/func/logics_onBoarding_goto.dart';

class StartUpButton extends StatelessWidget {
  const StartUpButton({
    super.key,
    required this.curnetpage,
  });

  final int curnetpage;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        switchInCurve: Curves.easeInOut,
        duration: const Duration(milliseconds: 600),
        child: curnetpage == 1
            ? CustomButton(
                titelcolor: AppColors.white,
                titel: "ابدأ الان",
                onPressed: () {
                  LogicsOnBoardingGoto.startnow(context);
                },
                style: CustomButtonsStyle.primeryButtonstyle,
              )
            : const SizedBox.shrink());
  }
}
