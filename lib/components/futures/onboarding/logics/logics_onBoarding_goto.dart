// components/futures/onboarding/logics/logics_onBoarding_goto.dart
import 'package:flutter/material.dart';

import '../../../../core/constant/keys.dart';
import '../../../../service/database/presence.dart';
import '../../Auth/signin/views/Signin.dart';

class LogicsOnBoardingGoto {
  static void startnow(BuildContext context) {
    Preferences.setBool(Keys.isviewedOnBoarding, true);
    Navigator.pushReplacementNamed(context, Signin.route);
  }
}
