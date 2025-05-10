import 'package:flutter/material.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

class TitelPageOne extends StatelessWidget {
  const TitelPageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: "مرحبًا بك في ",
        style: TextsStyle.bold23.copyWith(color: AppColors.grayscale950),
      ),
      TextSpan(
        text: "HUB ",
        style: TextsStyle.bold23.copyWith(color: AppColors.orange500),
      ),
      TextSpan(
        text: "Fruit ",
        style: TextsStyle.bold23.copyWith(color: AppColors.green1500),
      )
    ]));
  }
}
