// components/futures/Auth/signin/views/Signin.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/main_viwe.dart';

import '../../../../../core/custom/widgets/custom_Appbar.dart';
import '../../../../../service/state_management/sginin_cubit/siginin_cubit_cubit.dart';
import '../logics/listener.dart';

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
            listener: (context, state) async {
              await signinlistener(state, context);
            },
            builder: (context, state) {
              return state is SigninLoading
                  ? const Center(child: SpinKitChasingDots(color: Colors.green))
                  : const SinginMainViwe();
            },
          );
        }),
      ),
    );
  }
}
