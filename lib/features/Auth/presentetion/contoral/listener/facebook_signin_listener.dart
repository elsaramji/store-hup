
import 'package:flutter/material.dart';
import '../../../../../core/custom/loading_showDialog.dart';
import '../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../blocs/signin_facebook_cubit/signin_with_facebook_cubit.dart';

facebookSigninListener(
  SigninWithFacebookState state,
  BuildContext context,
) {
  switch (state) {
    case SigninWithFacebookLoading():
      loadingDialog(context);
      break;
    case SigninWithFacebookSuccess():
      Navigator.of(context, rootNavigator: true).pop();
      // context.go(HomeMainView.route);
      break;
    case SigninWithFacebookError():
      Navigator.of(context, rootNavigator: true).pop();
      ErrorsMassage.errorsBar(context, state.error.errorMassage);
      break;
    case SigninWithFacebookInitial():
      // Do nothing
      break;
  }
  /*
  if (state is SigninWithFacebookLoading) {
    loadingDialog(context);
  } else if (state is SigninWithFacebookSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    // context.go(HomeMainView.route);
  } else if (state is SigninWithFacebookError) {
    log(state.error.runtimeType.toString());
    Navigator.of(context, rootNavigator: true).pop();
    ErrorsMassage.errorsBar(context, state.error.errorMassage);
  }*/
}
