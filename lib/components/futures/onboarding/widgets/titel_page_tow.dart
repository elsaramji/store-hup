import 'package:flutter/material.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class TitelPageTow extends StatelessWidget {
  const TitelPageTow({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "ابحث وتسوق",
      style: TextsStyle.bold23.copyWith(color: AppColors.grayscale950),
      textAlign: TextAlign.center,
    );
  }
}
