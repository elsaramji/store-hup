// features/Auth/signup/view/signup_view_builder.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/context_value.dart';
import '../../../../core/custom/loading_showDialog.dart';
import '../../../../core/custom/widgets/custom_Appbar.dart';
import '../../../../core/custom/widgets/custom_errors_massage.dart';
import '../blocs/signup_email_cubit/signupwith_emailand_password_cubit.dart';
import '../widgets/checkpolicies.dart';
import '../widgets/have_account.dart';
import '../widgets/signup_Button.dart';
import '../widgets/user_form_signup_data.dart';

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
                    UserFormSignupData(
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
