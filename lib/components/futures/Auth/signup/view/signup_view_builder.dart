// components/futures/Auth/signup/view/signup_view_builder.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signup_email_cubit/signupwith_emailand_password_cubit.dart';
import 'package:store_hup/components/futures/Auth/signup/widgets/checkpolicies.dart';
import 'package:store_hup/components/futures/Auth/signup/widgets/have_account.dart';
import 'package:store_hup/components/futures/Auth/signup/widgets/signup_Button.dart';
import 'package:store_hup/components/futures/Auth/signup/widgets/user_form_data.dart';
import 'package:store_hup/core/constant/context_value.dart';
import 'package:store_hup/core/custom/loading_showDialog.dart';
import 'package:store_hup/core/custom/widgets/custom_Appbar.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';

class SignupMainviwe extends StatefulWidget {
  static const route = '/signup';
  SignupMainviwe({super.key});
  @override
  State<SignupMainviwe> createState() => _SignupMainviweState();
}

class _SignupMainviweState extends State<SignupMainviwe> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupwithEmailandPasswordCubit>(
        create: (context) => SignupwithEmailandPasswordCubit(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: customAppBar(
                context: context,
                title: 'تسجيل حساب',
                iconleading: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            body: BlocListener<SignupwithEmailandPasswordCubit,
                SignupwithEmailandPasswordState>(
              listener: (context, state) {
                if (state is SignupwithEmailandPasswordError) {
                  Navigator.of(context, rootNavigator: true).pop();
                  ErrorsMassage.errorsBar(context, state.error.errorMassage);
                } else if (state is SignupwithEmailandPasswordSuccess) {
                  Navigator.of(context, rootNavigator: true).pop();
                  // context.go(HomeMainView.route);
                } else if (state is SignupwithEmailandPasswordLoading) {
                  loadingDialog(context);
                }
              },
              child: SingleChildScrollView(
                child: Container(
                  margin: context.marginHorizontal16,
                  child: Column(children: [
                    context.verticalSizedBox24,
                    UserFormData(
                        formkey: formkey,
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController),
                    context.verticalSizedBox16,
                    ChackPolices(
                      onChanged: (value) {
                        isChecked = value;
                        setState(() {});
                      },
                    ),
                    context.verticalSizedBox16,
                    SignupButton(
                      isChecked: isChecked,
                      formkey: formkey,
                      emailController: emailController,
                      passwordController: passwordController,
                      nameController: nameController,
                    ),
                    context.verticalSizedBox16,
                    const HaveAccount(),
                  ]),
                ),
              ),
            ),
          );
        }));
  }
}
