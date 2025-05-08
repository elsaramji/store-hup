import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signup_email_cubit/signupwith_emailand_password_cubit.dart';
import 'package:store_hup/components/futures/Auth/data/models/user_model.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';

void signupAction(
  BuildContext context,
  final GlobalKey<FormState> formkey,
  final TextEditingController nameController,
  final TextEditingController emailController,
  final TextEditingController passwordController,
  bool isChecked,
) {
  switch (isChecked) {
    case true:
      if (formkey.currentState!.validate()) {
        BlocProvider.of<SignupwithEmailandPasswordCubit>(context)
            .signupWithEmailAndPassword(
          password: passwordController.text,
          userEntity:
              UserModel(name: nameController.text, email: emailController.text),
        );
      }
      break;
    case false:
      ErrorsMassage.errorsBar(
        context,
        "يجب الموافقة على الشروط والاحكام",
      );
      break;
  }
}
