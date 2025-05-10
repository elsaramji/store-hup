import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

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
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(path_image),
      title: Text(
        title,
        style: TextsStyle.regular16.copyWith(color: AppColors.grayscale950),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.grayscale500,
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
