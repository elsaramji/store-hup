import 'package:flutter/material.dart';

import '../../../../../core/custom/loading_showDialog.dart';
import '../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../blocs/signup_email_cubit/signupwith_emailand_password_cubit.dart';

void signup_Listener(
    SignupwithEmailandPasswordState state, BuildContext context) {
  switch (state) {
    case SignupwithEmailandPasswordLoading():
      loadingDialog(context);
      break;
    case SignupwithEmailandPasswordError():
      Navigator.of(context, rootNavigator: true).pop();
      ErrorsMassage.errorsBar(context, state.error.errorMassage);
      break;
    case SignupwithEmailandPasswordSuccess():
      Navigator.of(context, rootNavigator: true).pop();
      // context.go(HomeMainView.route);
      break;
    case SignupwithEmailandPasswordInitial():
      // Do nothing
      break;
  }
  /* if (state is SignupwithEmailandPasswordError) {
      Navigator.of(context, rootNavigator: true).pop();
      ErrorsMassage.errorsBar(context, state.error.errorMassage);
    } else if (state is SignupwithEmailandPasswordSuccess) {
      Navigator.of(context, rootNavigator: true).pop();
      // context.go(HomeMainView.route);
    } else if (state is SignupwithEmailandPasswordLoading) {
      loadingDialog(context);
    }*/
}
