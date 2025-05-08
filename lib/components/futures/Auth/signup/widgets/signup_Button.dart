// components/futures/Auth/signup/widgets/signup_Button.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/data/func/signup_by_email_listener.dart';

import '../../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../../core/custom/widgets/custom_button.dart';
import '../../../../../core/styles/color_style.dart';

class SignupButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool isChecked;
  SignupButton({
    super.key,
    required this.isChecked,
    required this.formkey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      titelcolor: AppColors.white,
      titel: "انشاء حساب",
      onPressed: () {
        signupAction(
            context,
            widget.formkey,
            widget.nameController,
            widget.emailController,
            widget.passwordController,
            widget.isChecked);
      },
      style: CustomButtonsStyle.primeryButtonstyle,
    );
  }
}
