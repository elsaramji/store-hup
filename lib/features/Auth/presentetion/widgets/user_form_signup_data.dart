import 'package:flutter/material.dart';

import '../../../../core/constant/context_value.dart';
import '../../../../core/constant/items.dart';
import '../../../../core/custom/widgets/custom_text_filed.dart';

class UserFormSignupData extends StatelessWidget {
  const UserFormSignupData({
    super.key,
    required this.formkey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(
          children: [
            CustomTextformField(
              controller: nameController,
              keybordetepy: TextInputType.name,
              hinttext: "الاسم كامل",
            ),
            context.verticalSizedBox16,
            CustomTextformField(
              controller: emailController,
              keybordetepy: TextInputType.emailAddress,
              hinttext: "البريد الالكتروني",
            ),
            context.verticalSizedBox16,
            CustomTextformField(
              controller: passwordController,
              keybordetepy: TextInputType.visiblePassword,
              hinttext: "كلمة المرور",
              obscuretext: true,
              suffixicons: Items.visiibleIcons,
            ),
          ],
        ));
  }
}
