// components/futures/onboarding/logics/logics_onBoarding_goto.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_hup/components/futures/Auth/signin/views/Signin.dart';

import '../../../../../core/constant/keys.dart';
import '../../../../../service/database/presence.dart';


class LogicsOnBoardingGoto {
  static void startnow(BuildContext context) {
    Preferences.setBool(Keys.isviewedOnBoarding, true);
    context.go(Signin.route);
  }
}
