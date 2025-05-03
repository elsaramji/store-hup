// components/futures/Auth/signup/view/signup_view_builder.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/injection/Git_it.dart';
import '../../../../../../core/injection/firebase/auth/auth_service.dart';
import '../../../../../../service/state_management/sginup_cubit/sginup_cubit.dart';
import '../logics/singup_logics_state.dart';

class Signup extends StatelessWidget {
  static const route = '/signup';
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<FirebaseAuthService>()),
      child: Builder(builder: (context) {
        return const BlocConsumer<SignupCubit, SignupState>(
          listener: SignupLogicsState.singupBlocListener,
          builder: SignupLogicsState.singupBlocBuilder,
        );
      }),
    );
  }
}
