// core/custom/widgets/CustomHome/custom_prodcut_searchbar.dart
import 'package:flutter/material.dart';

import '../../../assets/assets_image.dart';
import '../../../styles/color_style.dart';
import '../../../styles/font_style.dart';

class CustomProductSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  const CustomProductSearchBar({
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 40,
        decoration: const BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hoverColor: AppColors.white,
                filled: true,
                fillColor: AppColors.white,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: Image.asset(
                  Assets.assetsImagesSearchNormal,
                ),
                hintText: 'ابحث عن.......',
                hintStyle: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale400),
                suffixIcon: Image.asset(
                  Assets.assetsImagesSetting,
                ),
              )),
        ),
      ),
    );
  }
}
