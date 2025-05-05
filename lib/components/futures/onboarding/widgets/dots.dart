// components/futures/onboarding/widgets/dots.dart
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/onboarding/data/bord_data.dart';

import '../../../../core/styles/color_style.dart';

class DotsPage extends StatelessWidget {
  const DotsPage({
    super.key,
    required this.curnetpage,
  });

  final int curnetpage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      animate: true,
      animationDuration: const Duration(milliseconds: 600),
      dotsCount: BordData.pagesdata.length,
      decorator: DotsDecorator(
        activeColor: AppColors.primaryColor,
        color: curnetpage != 1
            ? AppColors.primaryColor.withAlpha(50)
            : AppColors.primaryColor,
      ),
    );
  }
}
