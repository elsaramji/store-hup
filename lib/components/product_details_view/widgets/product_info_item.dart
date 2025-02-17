// components/product_details_view/widgets/product_info_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

class InfoItem extends StatelessWidget {
  final String title, subtitle, imagePath;

  const InfoItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          height: 64,
        ),
        Column(children: [
          Text(title,
              style: TextsStyle.bold16.copyWith(
                color: AppColors.green600,
              )),
          Text(
            subtitle,
            style: TextsStyle.regular16.copyWith(
              color: AppColors.grayscale600,
            ),
          )
        ]),
      ],
    );
  }
}

