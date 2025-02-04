// components/futures/Splash/logics/splash_logic.dart

import 'package:flutter/material.dart';

import '../../../../core/constant/keys.dart';
import '../../../../core/injection/Git_it.dart';
import '../../../../service/database/presence.dart';
import '../../../../service/firebase/auth/auth_service.dart';
import '../../../Home/views/home_view.dart';
import '../../Auth/signin/views/Signin.dart';
import '../../onboarding/view/view_main.dart';

class SplashLogic {
  static void goToApp(context) async {
    final authService = getIt<FirebaseAuthService>();
    await Future.delayed(const Duration(seconds: 3));
    if (authService.isLoggedIn()) {
      Navigator.pushReplacementNamed(context, HomeMainView.id);
    } else if (Preferences.getBool(Keys.isviewedOnBoarding)) {
      Navigator.pushReplacementNamed(context, Signin.route);
    } else {
      Navigator.popAndPushNamed(context, MainBoards.route);
    }
  }
}
