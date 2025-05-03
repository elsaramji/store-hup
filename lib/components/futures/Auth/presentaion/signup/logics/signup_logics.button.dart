// components/futures/Auth/signup/logics/signup_logics.button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../../../../../service/state_management/sginup_cubit/sginup_cubit.dart';

class SignupLogicsButton {
  static void createAccountClick(BuildContext context, autovalidateMode,
      teamPolicesAccept, formkey, name, email, password) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      if (teamPolicesAccept) {
        BlocProvider.of<SignupCubit>(context).signup(
          name: name,
          email: email,
          password: password,
        );
      } else {
        ErrorsMassage.errorsBar(context, "يجب الموافقة على الشروط والاحكام");
      }
    } else {
      ErrorsMassage.errorsBar(context, "يجب ملء جميع الخانات");
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
