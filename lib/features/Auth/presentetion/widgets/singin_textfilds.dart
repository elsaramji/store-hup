// features/Auth/signin/widgets/singin_textfilds.dart
import 'package:flutter/material.dart';

import '../../../../core/constant/context_value.dart';
import '../../../../core/constant/items.dart';
import '../../../../core/custom/widgets/custom_text_filed.dart';
import 'forgetpassword.dart';
import 'signin_Button.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    super.key,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextformField(
            controller: emailcontroller,
            keybordetepy: TextInputType.emailAddress,
            hinttext: "البريد الالكتروني",
          ),
          context.verticalSizedBox16,
          CustomTextformField(
            controller: passwordcontroller,
            keybordetepy: TextInputType.visiblePassword,
            hinttext: "كلمة المرور",
            obscuretext: true,
            suffixicons: Items.visiibleIcons,
          ),
          context.verticalSizedBox16,
          const NavigateForgetpassword(),
          context.verticalSizedBox16,
          SigninButton(
              formkey: formkey,
              emailcontroller: emailcontroller,
              passwordcontroller: passwordcontroller,
              context: context),
        ],
      ),
    );
  }
}
