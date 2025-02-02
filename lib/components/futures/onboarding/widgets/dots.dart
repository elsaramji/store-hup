// components/futures/onboarding/widgets/dots.dart
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

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
      dotsCount: 2,
      decorator: DotsDecorator(
        activeColor: AppColors.primaryColor,
        color: curnetpage != 1
            ? AppColors.primaryColor.withOpacity(0.5)
            : AppColors.primaryColor,
      ),
    );
  }
}
