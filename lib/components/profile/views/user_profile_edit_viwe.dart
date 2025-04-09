import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
import 'package:store_hup/core/custom/widgets/custom_text_filed.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/core/injection/firebase/auth/auth_service.dart';
import 'package:store_hup/core/models/user_entity.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/service/database/presence.dart';

class UserProfileEditView extends StatefulWidget {
  late Usermodel usermodel;
  static const routeName = '/userProfileEditView';
  static const index = 3;
  UserProfileEditView({super.key});

  @override
  State<UserProfileEditView> createState() => _UserProfileEditViewState();
}

class _UserProfileEditViewState extends State<UserProfileEditView> {
  @override
  void initState() {
    widget.usermodel = Usermodel.fromMap(jsonDecode(
        Preferences.getStringfromShared(
            getIt<FirebaseAuthService>().getUserId())!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل الحساب'),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomTextformField(
                keybordetepy: TextInputType.text,
                hinttext: 'اسم المستخدم',
                initialValue: widget.usermodel.name,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextformField(
                keybordetepy: TextInputType.text,
                hinttext: 'البريد الالكتروني',
                initialValue: widget.usermodel.email,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                titel: "حفظ التغيرات",
                onPressed: () {},
                titelcolor: AppColors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                titel: "تغير كلمة المرور",
                onPressed: () {
                  getIt<FirebaseAuthService>()
                      .forgetPassword(email: widget.usermodel.email!);
                },
                titelcolor: AppColors.white,
              ),
            ],
          )),
    );
  }
}
