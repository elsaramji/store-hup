// features/Auth/forgetpassword/view/forget_password_viwe.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/context_value.dart';
import '../../../../core/custom/widgets/custom_Appbar.dart';
import '../../../../core/custom/widgets/custom_button.dart';
import '../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../../../core/custom/widgets/custom_text_filed.dart';
import '../../../../core/injection/Git_it.dart';
import '../../../../core/injection/firebase/auth/auth_service.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../../../../service/state_management/forgetpassword_cubit/forgetpassword_cubit.dart';
import 'signin_view.dart';

// ignore: must_be_immutable
class ForgetPasswordViwe extends StatelessWidget {
  static const route = '/forgetPasswordViwe';
  TextEditingController emailcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ForgetPasswordViwe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'اعادة تعيين كلمة المرور',
          iconleading: const Icon(Icons.arrow_back_ios)),
      body: BlocProvider(
        create: (context) => ForgetpasswordCubit(getIt<FirebaseAuthService>()),
        child: Builder(builder: (context) {
          return BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
            listener: (context, state) {
              if (state is ForgetpasswordSuccess) {
                ErrorsMassage.errorsBar(
                    context, "تم ارسال رمز التحقق الى بريدك الالكتروني");

                Navigator.pushReplacementNamed(context, Signin.route);
              } else if (state is ForgetpasswordError) {
                ErrorsMassage.errorsBar(context, state.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.5),
                  child: Column(children: [
                    context.verticalSizedBox30,
                    Text(
                      "لا تقلق  ما عليك سوى كتابة البريد الالكتروني وسنرسل رمز التحقق.",
                      style: TextsStyle.semibold16
                          .copyWith(color: AppColors.grayscale400),
                    ),
                    context.verticalSizedBox30,
                    CustomTextformField(
                      controller: emailcontroller,
                      keybordetepy: TextInputType.emailAddress,
                      hinttext: "البريد الالكتروني",
                    ),
                    context.verticalSizedBox30,
                    CustomButton(
                        titel: "نسيت كلمة المرور",
                        titelcolor: AppColors.white,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<ForgetpasswordCubit>(context)
                                .forgetPassword(emailcontroller.text);
                          }
                        }),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ]),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
