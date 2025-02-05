// components/Home/custom/widgets/custom_home_appbar.dart
import 'package:flutter/material.dart';
import '../../../../core/assets/assets_image.dart';
import '../../../../core/custom/widgets/CustomHome/custom_notification_icon.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  final String userName;
  const CustomHomeAppBar({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(Assets.assetsImagesProfile),
          title: Text(
            "صباح الخير !...",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale400),
          ),
          subtitle: Text(
            userName,
            //getIt<FirebaseAuthService>().getUser()!.name ?? "",
            style: TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
          ),
          //#EEF8ED
          trailing: const NotificationIcon()),
    );
  }
}
