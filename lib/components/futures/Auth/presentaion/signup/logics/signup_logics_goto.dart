// components/futures/Auth/signup/logics/signup_logics_goto.dart
import 'package:flutter/material.dart';

import '../../signin/views/Signin.dart';


class SignupLogicsGoto {
  static void gotoSignin(BuildContext context) {
    Navigator.pushNamed(context, Signin.route);
  }

 
}
