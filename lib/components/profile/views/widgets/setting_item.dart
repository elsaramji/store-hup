import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class SettingsItem extends StatelessWidget {
  final String title, path_image;
  final Function()? onTap;
  const SettingsItem({
    this.onTap,
    required this.title,
    required this.path_image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Row(children: [
              SvgPicture.asset(
                path_image,
              ),
              Text(
                title,
                style: TextsStyle.semibold13.copyWith(
                  color: AppColors.grayscale400,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(Assets.assetsImagesArrowRight)
            ]),
            const Divider(
              color: AppColors.grayscale200,
              height: 1,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
