// components/futures/Auth/signin/logics/logics_singin_goto.dart

import 'package:flutter/material.dart';

import '../../forgetpassword/view/forget_password_viwe.dart';
import '../../signup/view/signup_view_builder.dart';

class SigninLogicsGoto {
  static void gotoSignup(BuildContext context) {
    Navigator.pushNamed(context, Signup.route);
  }

  static void gotoForgetpassword(BuildContext context) {
    Navigator.pushNamed(context, ForgetPasswordViwe.routeName);
  }
}
