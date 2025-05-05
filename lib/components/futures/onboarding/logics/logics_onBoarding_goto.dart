// components/futures/onboarding/logics/logics_onBoarding_goto.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/keys.dart';
import '../../../../service/database/presence.dart';
import '../../Auth/presentaion/signin/views/Signin.dart';

class LogicsOnBoardingGoto {
  static void startnow(BuildContext context) {
    Preferences.setBool(Keys.isviewedOnBoarding, true);
    context.go(Signin.route);
  }
}
