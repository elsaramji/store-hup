// components/futures/Auth/signin/views/Signin.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_cubit/signin_cubit_cubit.dart';
import 'package:store_hup/components/futures/Auth/data/func/signin_listener.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/main_viwe.dart';

import '../../../../../core/custom/widgets/custom_Appbar.dart';

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
        create: (context) => SigninCubitCubit(),
        child: Builder(builder: (context) {
          return BlocListener<SigninCubitCubit, SigninCubitState>(
            listener: (context, state) {
              signinListener(state, context);
            },
            child: const SinginMainViwe(),
          );
        }),
      ),
    );
  }
}
