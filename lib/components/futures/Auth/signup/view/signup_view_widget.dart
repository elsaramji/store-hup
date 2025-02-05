// components/futures/Auth/signup/view/signup_view_widget.dart


import 'package:flutter/material.dart';


import '../widgets/have_account.dart';
import '../widgets/signup_addUserform.dart';

class SignupView extends StatelessWidget {
  const SignupView({
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
            AddUserForm(),
            SizedBox(height: 26),
            HaveAccount()
          ],
        ),
      ),
    );
  }
}
