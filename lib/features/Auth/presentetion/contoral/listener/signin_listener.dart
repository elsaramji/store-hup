import 'package:flutter/material.dart';

import '../../../../../core/custom/loading_showDialog.dart';
import '../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../blocs/signin_cubit/signin_cubit_cubit.dart';

void signinWithEmailandPasswordListener(
    SigninCubitState state, BuildContext context) {
  switch (state) {
    case SigninCubitLoading():
      loadingDialog(context);
      break;
    case SigninCubitError():
      Navigator.of(context, rootNavigator: true).pop();
      ErrorsMassage.errorsBar(context, state.error.errorMassage);
      break;
    case SigninCubitSuccess():
      Navigator.of(context, rootNavigator: true).pop();
      // context.go(HomeMainView.route);
      break;
  }
  /*if (state is SigninCubitLoading) {
    loadingDialog(context);
  } else if (state is SigninCubitError) {
    Navigator.of(context, rootNavigator: true).pop();
    ErrorsMassage.errorsBar(context, state.error.errorMassage);
  } else if (state is SigninCubitSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    // context.go(HomeMainView.route);
  }*/
}
