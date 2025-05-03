// components/futures/Auth/signup/logics/singup_logics_state.dart

import 'package:flutter/material.dart';


import '../../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../../../../../service/state_management/sginup_cubit/sginup_cubit.dart';
import '../widgets/main_views.dart';

class SignupLogicsState {
  static void singupBlocListener(context, state) async {
    if (state is SignupError) {
      ErrorsMassage.errorsBar(context, state.message);
    }
    if (state is SignupSuccess) {
      ErrorsMassage.errorsBar(context, 'تم التسجيل بنجاح');
    }
  }

  static Widget singupBlocBuilder(context, state) {
    return MainViews(state: state,);
  }
}



