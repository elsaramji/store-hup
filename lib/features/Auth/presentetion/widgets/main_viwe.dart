// features/Auth/signin/widgets/main_viwe.dart
import 'package:flutter/material.dart';

import '../../../../core/constant/context_value.dart';
import '../../../../core/custom/widgets/custom_or_divider.dart';

import 'dont_have_account.dart';
import 'singin_textfilds.dart';
import 'social_auth_buttons.dart';

class SinginMainViwe extends StatelessWidget {
  const SinginMainViwe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
