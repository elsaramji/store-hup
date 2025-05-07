import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/google_signin_cubit/google_signin_cubit.dart';
import 'package:store_hup/core/custom/loading_showDialog.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';

void googleSigninListener(GoogleSigninState state, BuildContext context) {
  if (state is GoogleSigninError) {
    Navigator.of(context, rootNavigator: true).pop();
    ErrorsMassage.errorsBar(context, state.error.errorMassage.toString());
  } else if (state is GoogleSigninSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    // context.go(HomeMainView.route);
  } else if (state is GoogleSigninLoading) {
    loadingDialog(context);
  }
}
