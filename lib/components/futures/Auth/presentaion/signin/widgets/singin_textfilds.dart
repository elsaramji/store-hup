// components/futures/Auth/signin/widgets/singin_textfilds.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/presentaion/signin/widgets/forgetpassword.dart';
import 'package:store_hup/components/futures/Auth/presentaion/signin/widgets/login_Button.dart';

import '../../../../../../../core/constant/items.dart';
import '../../../../../../../core/custom/widgets/custom_text_filed.dart';
import '../../../../../../../service/state_management/sginin_cubit/siginin_cubit_cubit.dart';

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
          const SizedBox(height: 16),
          CustomTextformField(
            keybordetepy: TextInputType.visiblePassword,
            hinttext: "كلمة المرور",
            obscuretext: true,
            onsaved: (value) {
              password = value!;
            },
            suffixicons: Items.visiibleIcons,
          ),
          const SizedBox(height: 16),
          const NavigateForgetpassword(),
          const SizedBox(height: 16),
          SigninButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                context.read<SigninCubit>().signInWithemailandpassword(
                    email: email, password: password);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
