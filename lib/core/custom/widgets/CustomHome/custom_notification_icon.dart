// core/custom/widgets/CustomHome/custom_notification_icon.dart
import 'package:flutter/material.dart';

import '../../../assets/assets_image.dart';
import '../../../styles/color_style.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.green50,
      child: SizedBox(
          height: 20,
          width: 20,
          child: Image.asset(Assets.assetsImagesNotification)),
    );
  }
}