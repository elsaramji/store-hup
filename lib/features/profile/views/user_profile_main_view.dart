// features/profile/user_profile.dart
// features/profile/user_profile.dar

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/profile/views/user_oder_viwe.dart';
import '../../../features/profile/views/user_profile_edit_viwe.dart';
import '../../../features/profile/views/widgets/setting_item.dart';
import '../../../core/assets/assets_image.dart';
import '../../../core/custom/widgets/custom_button.dart';
import '../../../core/injection/Git_it.dart';
import '../../../core/injection/firebase/auth/auth_service.dart';
import '../../../core/models/user_entity.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';
import '../../../service/database/presence.dart';
import '../../Auth/presentetion/views/signin_view.dart';

class UserProfile extends StatefulWidget {
  static const routeName = '/userProfile';
  static const index = 3;

  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Usermodel usermodel;
  @override
  void initState() {
    usermodel = Usermodel.fromMap(jsonDecode(Preferences.getStringfromShared(
        getIt<FirebaseAuthService>().getUserId())!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('حسابي'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(Assets.assetsImagesProfile),
                title: Text(
                  textAlign: TextAlign.left,
                  usermodel.name ?? 'اسم المستخدم',
                  style: TextsStyle.semibold13.copyWith(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  textAlign: TextAlign.left,
                  usermodel.email ?? 'البريد الالكتروني',
                  style: TextsStyle.regular13.copyWith(
                    color: AppColors.grayscale500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 38,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "عام",
                  style: TextsStyle.semibold13,
                ),
              ),
              SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, UserProfileEditView.routeName,
                        arguments: usermodel);
                  },
                  title: "الملف الشخصي",
                  path_image: Assets.assetsImagesUser),
              SettingsItem(
                title: "الطلبات",
                onTap: () {
                  Navigator.pushNamed(context, UserOderViwe.routeName);
                },
                path_image: Assets.assetsImagesBox,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                titel: "تسجيل الخروج",
                onPressed: () async {
                  await getIt<FirebaseAuthService>().signOut();
                  Get.offAllNamed(Signin.route);
                },
                titelcolor: AppColors.primaryWhite,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
