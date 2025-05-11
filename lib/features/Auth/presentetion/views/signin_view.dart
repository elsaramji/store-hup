// features/Auth/signin/views/Signin.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/context_value.dart';
import '../../../../core/custom/widgets/custom_Appbar.dart';
import '../../../../core/custom/widgets/custom_or_divider.dart';
import '../blocs/google_signin_cubit/google_signin_cubit.dart';
import '../blocs/signin_cubit/signin_cubit_cubit.dart';
import '../blocs/signin_facebook_cubit/signin_with_facebook_cubit.dart';
import '../contoral/listener/facebook_signin_listener.dart';
import '../contoral/listener/google_signin_listene.dart';
import '../contoral/listener/signin_listener.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/singin_textfilds.dart';
import '../widgets/social_auth_buttons.dart';

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
          return MultiBlocListener(
            listeners: [
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
            ],
            child: Container(
              margin: context.marginHorizontal16,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate(
                    [
                      context.verticalSizedBox24,
                      const SigninForm(),

                      // NotHaveAccount
                      context.verticalSizedBox16,
                      const DonthaveAccount(),
                      // OrDivider
                      context.verticalSizedBox16,
                      const CustomOrDivider(),
                      // SocialButtonSection
                      const SocialButtonSection()
                    ],
                  ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
