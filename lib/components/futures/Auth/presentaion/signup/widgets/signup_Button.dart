// components/futures/Auth/signup/widgets/signup_Button.dart
import 'package:flutter/material.dart';


import '../../../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../../../core/custom/widgets/custom_button.dart';
import '../../../../../../core/styles/color_style.dart';

class SignupButton extends StatelessWidget {
  final void Function() onPressed;
  const SignupButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
       titelcolor: AppColors.white,
      titel: "انشاء حساب",
      onPressed: onPressed,
      style: CustomButtonsStyle.primeryButtonstyle,
    );
  }
}
