// features/Auth/signin/widgets/login_Button.dart
import 'package:flutter/material.dart';

import '../../../../core/custom/widgets/custom_button.dart';
import '../../../../core/styles/color_style.dart';
import '../contoral/actions/signin_with_email_action.dart';

class SigninButton extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<FormState> formkey;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  SigninButton({
    super.key,
    required this.context,
    required this.formkey,
    required this.emailcontroller,
    required this.passwordcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      titelcolor: AppColors.white,
      titel: "تسجيل الدخول",
      onPressed: () => signinWithEmailandpasswordAction(
        context,
        formkey,
        emailcontroller,
        passwordcontroller,
      ),
    );
  }
}
