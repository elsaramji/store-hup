import 'package:flutter/material.dart';
import '../../../../../core/custom/loading_showDialog.dart';
import '../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../blocs/google_signin_cubit/google_signin_cubit.dart';

void googleSigninListener(GoogleSigninState state, BuildContext context) {

  switch (state) {
    case GoogleSigninLoading():
      loadingDialog(context);
      break;
    case GoogleSigninError():
      Navigator.of(context, rootNavigator: true).pop();
      ErrorsMassage.errorsBar(context, state.error.errorMassage.toString());
      break;
    case GoogleSigninSuccess():
      Navigator.of(context, rootNavigator: true).pop();
      // context.go(HomeMainView.route);
      break;
    case GoogleSignin():
      // Do nothing
      break;
  }
  
  /*if (state is GoogleSigninError) {
    Navigator.of(context, rootNavigator: true).pop();
    ErrorsMassage.errorsBar(context, state.error.errorMassage.toString());
  } else if (state is GoogleSigninSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    // context.go(HomeMainView.route);
  } else if (state is GoogleSigninLoading) {
    loadingDialog(context);
  }*/
}
