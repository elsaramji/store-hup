// components/futures/onboarding/view/view_one.dart

import 'package:flutter/material.dart';
import '../../../../core/assets/assets_image.dart';
import '../widgets/custom_boarding.dart';
import '../widgets/skip.dart';
import '../widgets/welcom_massage.dart';

class BoardOne extends StatelessWidget {
  const BoardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(children: [
        CustomBoard(
          subtitel:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          bacgroundpath: Assets.assetsImagesBackgroundonboardingone,
          imagepath: Assets.assetsImagesFruitsonbording,
          title: Welcomemassage(),
        ),
        Skip(),
      ]),
    );
  }
}
