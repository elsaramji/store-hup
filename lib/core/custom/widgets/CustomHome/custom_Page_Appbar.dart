// core/custom/widgets/CustomHome/custom_Page_Appbar.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/core/custom/widgets/CustomHome/custom_notification_icon.dart';

import '../../../assets/assets_image.dart';
import '../../../styles/color_style.dart';
import '../../../styles/font_style.dart';

class CustomPageAppbar extends StatelessWidget {
  final String pagetitel;
  final bool? arrowback, notification;
  const CustomPageAppbar(
      {super.key, required this.pagetitel, this.arrowback, this.notification});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(child: const Arrowback(), visible: arrowback ?? true),
        const Spacer(),
        Text(
          pagetitel,
          style: TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
        ),
        const Spacer(),
        Visibility(
            visible: notification ?? true, child: const NotificationIcon()),
      ],
    );
  }
}

class Arrowback extends StatelessWidget {
  const Arrowback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffF1F1F5), width: 1),
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.white,
          child: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                Assets.assetsImagesArrowback,
              )),
        ));
  }
}
