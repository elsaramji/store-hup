// components/futures/Auth/signin/widgets/social_auth_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/google_signin_cubit/google_signin_cubit.dart';
import 'package:store_hup/core/constant/context_value.dart';

import '../../../../../../core/assets/assets_image.dart';
import '../../../../../../core/custom/widgets/custom_social_button.dart';
import '../../../../../../service/state_management/sginin_cubit/siginin_cubit_cubit.dart';

class SocialButtonSection extends StatelessWidget {
  const SocialButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.verticalSizedBox16,
        CustomSocialButton(
          title: "تسجيل بواسطة جوجل",
          iconphat: Assets.assetsImagesGoogle,
          onTouch: () {
            BlocProvider.of<GoogleSigninCubit>(context).signinWithGoogle();
          },
        ),
        context.verticalSizedBox16,
        CustomSocialButton(
          title: "تسجيل بواسطة فيسبوك",
          iconphat: Assets.assetsImagesFacebook,
          onTouch: () {
            BlocProvider.of<SigninCubit>(context).signinWithFacebook();
          },
        ),
        context.verticalSizedBox16
      ],
    );
  }
}
