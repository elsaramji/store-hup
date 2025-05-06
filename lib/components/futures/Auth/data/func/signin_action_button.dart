import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_cubit/signin_cubit_cubit.dart';

void signinAction(BuildContext context, GlobalKey<FormState> formkey,
    String email, password) {
  if (formkey.currentState!.validate()) {
    formkey.currentState!.save();
    context
        .read<SigninCubitCubit>()
        .signinWithemailAndPassword(email: email, password: password);
  }
}
