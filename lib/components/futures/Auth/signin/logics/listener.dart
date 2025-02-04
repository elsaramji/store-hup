// components/futures/Auth/signin/logics/listener.dart
import 'package:flutter/material.dart';
import 'package:store_hup/core/injection/Git_it.dart';

import '../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../../../../service/firebase/auth/auth_service.dart';
import '../../../../../service/state_management/sginin_cubit/siginin_cubit_cubit.dart';
import '../../../../Home/views/home_view.dart';

void signinlistener(SigninState state, BuildContext context) {
  if (state is SigninError) {
    ErrorsMassage.errorsBar(context, state.error);
  }
  if (state is SigninSuccess) {
    if (getIt<FirebaseAuthService>().isLoggedIn()) {
      Navigator.pushReplacementNamed(context, HomeMainView.id);
    }
    ErrorsMassage.errorsBar(context, 'تم تسجيل الدخول بنجاح');
  }
}
