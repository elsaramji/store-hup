// components/futures/Auth/signup/view/signup_view_builder.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/futures/Auth/data/blocs/signup_email_cubit/signupwith_emailand_password_cubit.dart';
import 'package:store_hup/core/constant/context_value.dart';
import 'package:store_hup/core/custom/widgets/custom_Appbar.dart';
import 'package:store_hup/core/custom/widgets/custom_text_filed.dart';

class SignupMainviwe extends StatelessWidget {
  static const route = '/signup';
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(); 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   SignupMainviwe({super.key});

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
              listener: (context, state) {},
              child: SingleChildScrollView(
                child: Column(children: [
                  context.verticalSizedBox24,
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          CustomTextformField(
                            controller: nameController,
                            keybordetepy: TextInputType.name,
                            hinttext: "الاسم كامل",
                        
                          ),
                        ],
                      ))
                ]),
              ),
            ),
          );
        }));
  }
}
