import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_cubit/signin_cubit_cubit.dart';
import 'package:store_hup/core/custom/loading_showDialog.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';

void signinWithEmailandPasswordListener(
    SigninCubitState state, BuildContext context) {
  if (state is SigninCubitLoading) {
    loadingDialog(context);
  } else if (state is SigninCubitError) {
    Navigator.of(context, rootNavigator: true).pop();
    ErrorsMassage.errorsBar(context, state.error.errorMassage);
  } else if (state is SigninCubitSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    // context.go(HomeMainView.route);
  }
}
