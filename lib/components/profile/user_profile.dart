// components/profile/user_profile.dart
// components/profile/user_profile.dar

import 'package:flutter/material.dart';
import 'package:store_hup/components/profile/core/logic/local/user_hive.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/core/models/user_entity.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';
import 'package:store_hup/service/firebase/auth/auth_service.dart';

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
    usermodel = Usermodel.fromMap(
        UserHive.getUserData(uid: getIt<FirebaseAuthService>().getUserId()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('حسابي'),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(
              leading: Image.asset(Assets.assetsImagesProfile),
              title: Text(
                usermodel.name ?? 'اسم المستخدم',
                style: TextsStyle.bold13.copyWith(
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                usermodel.email ?? 'البريد الالكتروني',
                style: TextsStyle.regular13.copyWith(
                  color: AppColors.grayscale500,
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
