// components/futures/Auth/signin/widgets/main_viwe.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/dont_have_account.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/singin_textfilds.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/social_auth_buttons.dart';

import '../../../../../core/custom/widgets/custom_or_divider.dart';

class SinginMainViwe extends StatelessWidget {
  const SinginMainViwe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const SigninForm(),

            // NotHaveAccount
            const SizedBox(height: 33),
            DonthaveAccount(),
            // OrDivider
            const SizedBox(height: 33),
            CustomOrDivider(),
            // SocialButtonSection
            const SizedBox(height: 16),
            SocialButtonSection()
          ],
        ),
      ),
    );
  }
}
