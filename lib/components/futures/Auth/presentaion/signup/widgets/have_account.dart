// components/futures/Auth/signup/widgets/have_account.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/styles/color_style.dart';
import '../../../../../../core/styles/font_style.dart';
import '../logics/signup_logics_goto.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: "تمتلك حساب بالفعل؟ ",
        style: TextsStyle.semibold16.copyWith(color: AppColors.grayscale400),
      ),
      TextSpan(
          text: "تسجيل الدخول",
          style: TextsStyle.semibold16.copyWith(color: AppColors.green1500),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              SignupLogicsGoto.gotoSignin(context);
            }),
    ]));
  }
}
