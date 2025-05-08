import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_cubit/signin_cubit_cubit.dart';

void signinWithEmailandpasswordAction(
    BuildContext context,
    GlobalKey<FormState> formkey,
    TextEditingController emailcontroller,
    TextEditingController passwordcontroller) {
  if (formkey.currentState!.validate()) {
    formkey.currentState!.save();
    context.read<SigninCubitCubit>().signinWithemailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
  }
}
