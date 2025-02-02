// components/futures/onboarding/view/view_tow.dart
import 'package:flutter/material.dart';


import '../../../../core/assets/assets_image.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../widgets/custom_boarding.dart';

class BoardTow extends StatelessWidget {
  const BoardTow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomBoard(
            subtitel:
                "نقدم لك افضل الفواكه المختارة بعناية . اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            bacgroundpath: Assets.assetsImagesBackgroundonboardingtow,
            imagepath: Assets.assetsImagesPineappleonbording,
            title: Text(
              "ابحث وتسوق",
              style: TextsStyle.bold23.copyWith(color: AppColors.grayscale950),
              textAlign: TextAlign.center,
            )));
  }
}
