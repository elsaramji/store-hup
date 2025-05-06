// components/futures/Auth/signin/widgets/singin_textfilds.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signin_cubit/signin_cubit_cubit.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/forgetpassword.dart';
import 'package:store_hup/components/futures/Auth/signin/widgets/login_Button.dart';
import 'package:store_hup/core/constant/context_value.dart';

import '../../../../../../core/constant/items.dart';
import '../../../../../../core/custom/widgets/custom_text_filed.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    super.key,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final formkey = GlobalKey<FormState>();
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextformField(
            keybordetepy: TextInputType.emailAddress,
            hinttext: "البريد الالكتروني",
            onsaved: (value) {
              email = value!;
            },
          ),
          context.verticalSizedBox16,
          CustomTextformField(
            keybordetepy: TextInputType.visiblePassword,
            hinttext: "كلمة المرور",
            obscuretext: true,
            onsaved: (value) {
              password = value!;
            },
            suffixicons: Items.visiibleIcons,
          ),
          context.verticalSizedBox16,
          const NavigateForgetpassword(),
          context.verticalSizedBox16,
          SigninButton(onPressed: () {
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();
              context
                  .read<SigninCubitCubit>()
                  .signinWithemailAndPassword(email: email, password: password);
            }
          }),
        ],
      ),
    );
  }
}
