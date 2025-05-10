import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/google_signin_cubit/google_signin_cubit.dart';

void signinWithGoogle(BuildContext context) {
  BlocProvider.of<GoogleSigninCubit>(context).signinWithGoogle();
}
