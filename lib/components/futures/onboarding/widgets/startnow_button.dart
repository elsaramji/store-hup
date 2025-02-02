// components/futures/onboarding/widgets/startnow_button.dart

import 'package:flutter/material.dart';

import '../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../core/custom/widgets/custom_button.dart';
import '../../../../core/styles/color_style.dart';
import '../logics/logics_onBoarding_goto.dart';

class StartUpButton extends StatelessWidget {
  const StartUpButton({
    super.key,
    required this.curnetpage,
  });

  final int curnetpage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: curnetpage != 0 ? true : false,
      maintainAnimation: true,
      maintainSize: true,
      maintainState: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomButton(
           titelcolor: AppColors.white,
          titel: "ابدأ الان",
          onPressed: () {
            LogicsOnBoardingGoto.startnow(context);
          },
          style: CustomButtonsStyle.primeryButtonstyle,
        ),
      ),
    );
  }
}
