// components/navigation/widget/active_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/models/navigation_icon_entity.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class ActiveItem extends StatelessWidget {
  final NavigationIconEntity navigationIconEntity;
  const ActiveItem({super.key, required this.navigationIconEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: SvgPicture.asset(
              navigationIconEntity.activeimage,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            navigationIconEntity.name,
            style:
                TextsStyle.semibold11.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}