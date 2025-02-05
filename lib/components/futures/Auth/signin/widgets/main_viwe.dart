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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            SigninForm(),

            // NotHaveAccount
            SizedBox(height: 33),
            DonthaveAccount(),
            // OrDivider
            SizedBox(height: 33),
            CustomOrDivider(),
            // SocialButtonSection
            SizedBox(height: 16),
            SocialButtonSection()
          ],
        ),
      ),
    );
  }
}
