// components/futures/Auth/signin/widgets/main_viwe.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/dont_have_account.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/singin_textfilds.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/social_auth_buttons.dart';

import 'package:store_hup/core/constant/context_value.dart';
import '../../../../../../core/custom/widgets/custom_or_divider.dart';

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
              context.verticalSizedBox32,
              const DonthaveAccount(),
              // OrDivider
              context.verticalSizedBox32,
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
