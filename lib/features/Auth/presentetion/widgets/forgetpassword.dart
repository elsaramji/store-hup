// features/Auth/signin/widgets/forgetpassword.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../views/forget_password_viwe.dart';

class NavigateForgetpassword extends StatelessWidget {
  const NavigateForgetpassword({
    super.key,
  });

  @override
  Widget build(context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          context.push(ForgetPasswordViwe.route);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "نسيت كلمة المرور؟",
            style:
                TextsStyle.semibold13.copyWith(color: AppColors.primaryColor),
          ),
        ),
      );
    });
  }
}
