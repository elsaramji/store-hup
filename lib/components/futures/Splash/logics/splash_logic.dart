// components/futures/Splash/logics/splash_logic.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/keys.dart';
import '../../../../core/injection/Git_it.dart';
import '../../../../core/injection/firebase/auth/auth_service.dart';
import '../../../../service/database/presence.dart';
import '../../../Home/views/home_view.dart';
import '../../Auth/presentaion/signin/views/Signin.dart';
import '../../onboarding/view/view_main.dart';

class SplashLogic {
  void goToApp(BuildContext context) async {
    final authService = getIt<FirebaseAuthService>();
    bool islogged = await authService.isLoggedIn();

    await Future.delayed(const Duration(milliseconds: 700));
    if (islogged) {
      await getIt<FirebaseAuthService>().getUserId();
      log("logged user id is ${getIt<FirebaseAuthService>().getUserId()}");

      context.go(HomeMainView.id);
    } else if (Preferences.getBool(Keys.isviewedOnBoarding)) {
      context.go(Signin.route);
    } else {
      context.push(OnboardView.route);
    }
  }
}
