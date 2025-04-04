// components/futures/Auth/signin/logics/listener.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_hup/components/Home/views/home_view.dart';
import 'package:store_hup/components/profile/core/logic/local/user_hive.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/service/firebase/auth/auth_service.dart';

import '../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../../../../service/state_management/sginin_cubit/siginin_cubit_cubit.dart';

Future<void> signinlistener(SigninState state, BuildContext context) async {
  bool islogged = await getIt<FirebaseAuthService>().isLoggedIn();

  if (state is SigninError) {
    ErrorsMassage.errorsBar(context, state.error);
  } else if (state is SigninSuccess && islogged) {
    await Future.delayed(const Duration(seconds: 1));
    UserHive.addUserData(uid: state.user.uid!, user: state.user.toMap());
    Get.off(HomeMainView());
  }
}
