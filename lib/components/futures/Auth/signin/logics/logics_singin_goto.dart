// components/futures/Auth/signin/logics/logics_singin_goto.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_hup/components/futures/Auth/forgetpassword/view/forget_password_viwe.dart';
import 'package:store_hup/components/futures/Auth/signup/view/signup_view_builder.dart';


class SigninLogicsGoto {
  static void gotoSignup(BuildContext context) {
    //Navigator.pushNamed(context, Signup.route);
    context.push(Signup.route);
  }

  static void gotoForgetpassword(BuildContext context) {
    //Navigator.pushNamed(context, ForgetPasswordViwe.routeName);
    context.push(ForgetPasswordViwe.route);
  }
}
