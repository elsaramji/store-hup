// components/futures/Auth/signin/widgets/social_auth_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_facebook_cubit/signin_with_facebook_cubit.dart';
import 'package:store_hup/components/futures/Auth/data/func/signin_with_google_action.dart';
import 'package:store_hup/core/constant/context_value.dart';

import '../../../../../../core/assets/assets_image.dart';
import '../../../../../../core/custom/widgets/custom_social_button.dart';

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
            signinWithGoogle(context);
          },
        ),
        context.verticalSizedBox16,
        CustomSocialButton(
          title: "تسجيل بواسطة فيسبوك",
          iconphat: Assets.assetsImagesFacebook,
          onTouch: () {
            BlocProvider.of<SigninWithFacebookCubit>(context)
                .signinWithFacebook();
          },
        ),
        context.verticalSizedBox16
      ],
    );
  }
}
