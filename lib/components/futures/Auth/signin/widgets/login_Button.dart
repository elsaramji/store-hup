// components/futures/Auth/signin/widgets/login_Button.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/data/func/signin_with_email_action.dart';

import '../../../../../../core/custom/widgets/custom_button.dart';
import '../../../../../../core/styles/color_style.dart';

class SigninButton extends StatelessWidget {
  BuildContext context;
  GlobalKey<FormState> formkey;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;
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
