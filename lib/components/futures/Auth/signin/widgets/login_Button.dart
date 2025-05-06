// components/futures/Auth/signin/widgets/login_Button.dart
import 'package:flutter/material.dart';
import '../../../../../../core/custom/widgets/custom_button.dart';
import '../../../../../../core/styles/color_style.dart';

class SigninButton extends StatelessWidget {
 final VoidCallback onPressed;
  const SigninButton({
    super.key,
    required this.onPressed,
   
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      titelcolor: AppColors.white,
      titel: "تسجيل الدخول",
      onPressed:onPressed ,
    );
  }
}
