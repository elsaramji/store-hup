// components/futures/Auth/signin/views/Signin.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/google_signin_cubit/google_signin_cubit.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_cubit/signin_cubit_cubit.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_facebook_cubit/signin_with_facebook_cubit.dart';
import 'package:store_hup/components/futures/Auth/data/func/facebook_signin_listener.dart';
import 'package:store_hup/components/futures/Auth/data/func/google_signin_listene.dart';
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SigninCubitCubit>(
            create: (context) => SigninCubitCubit(),
          ),
          BlocProvider<GoogleSigninCubit>(
            create: (context) => GoogleSigninCubit(),
          ),
          BlocProvider<SigninWithFacebookCubit>(create: (context) {
            return SigninWithFacebookCubit();
          }),
        ],
        child: Builder(builder: (context) {
          return MultiBlocListener(listeners: [
            BlocListener<SigninCubitCubit, SigninCubitState>(
              listener: (context, state) {
                signinWithEmailandPasswordListener(state, context);
              },
            ),
            BlocListener<GoogleSigninCubit, GoogleSigninState>(
              listener: (context, state) {
                googleSigninListener(state, context);
              },
            ),
            BlocListener<SigninWithFacebookCubit, SigninWithFacebookState>(
              listener: (context, state) {
                facebookSigninListener(state, context);
              },
            ),
          ], child: const SinginMainViwe());
        }),
      ),
    );
  }
}
