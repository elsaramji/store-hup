// components/futures/exit/view/exit_dialog.dart
import 'package:flutter/material.dart';

import '../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../core/custom/widgets/custom_button.dart';
import '../../../../core/custom/widgets/custom_social_button.dart';
import '../../../../core/styles/color_style.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('هل تريد الخروج من التطبيق؟'),
      actions: <Widget>[
        CustomButton(
           titelcolor: AppColors.white,
          titel: "نعم",
          onPressed: () {},
          style: CustomButtonsStyle.primeryButtonstyle,
        ),
        CustomSocialButton(
          title: "لا",
          onTouch: () {
            //reset the state
          },
        )
      ],
    );
  }
}
