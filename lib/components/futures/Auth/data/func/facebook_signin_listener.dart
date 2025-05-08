import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_facebook_cubit/signin_with_facebook_cubit.dart';
import 'package:store_hup/core/custom/loading_showDialog.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';

facebookSigninListener(
  SigninWithFacebookState state,
  BuildContext context,
) {
  if (state is SigninWithFacebookLoading) {
    loadingDialog(context);
  } else if (state is SigninWithFacebookSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    // context.go(HomeMainView.route);
  } else if (state is SigninWithFacebookError) {
    log(state.error.runtimeType.toString());
    Navigator.of(context, rootNavigator: true).pop();
    ErrorsMassage.errorsBar(context, state.error.errorMassage);
  }
}
