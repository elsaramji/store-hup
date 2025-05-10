// features/Auth/signin/widgets/dont_have_account.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../views/signup_view.dart';

class DonthaveAccount extends StatelessWidget {
  const DonthaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "ليس لديك حساب ؟ ",
              style: TextsStyle.semibold13
                  .copyWith(color: AppColors.grayscale400)),
          TextSpan(
              text: "انشاء حساب",
              style: TextsStyle.semibold13.copyWith(color: AppColors.green1500),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.push(SignupMainviwe.route);
                }),
        ])),
      ],
    );
  }
}
