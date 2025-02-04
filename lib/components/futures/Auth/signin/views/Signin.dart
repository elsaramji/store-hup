// components/futures/Auth/signin/views/Signin.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/custom/widgets/custom_Appbar.dart';
import '../../../../../core/custom/widgets/custom_loadingProgress.dart';
import '../../../../../service/state_management/sginin_cubit/siginin_cubit_cubit.dart';
import '../logics/listener.dart';
import '../widgets/main_viwe.dart';

class Signin extends StatelessWidget {
  static const route = '/login_view';

  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'تسجيل الدخول',
      ),
      body: BlocProvider(
        create: (context) => SigninCubit(),
        child: Builder(builder: (context) {
          return BlocConsumer<SigninCubit, SigninState>(
            listener: (context, state) {
              signinlistener(state, context);
            },
            builder: (context, state) {
              return CustomLoadingProgress(
                  isOn: state is SigninLoading ? true : false,
                  child: SinginMainViwe());
            },
          );
        }),
      ),
    );
  }
}
