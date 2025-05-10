// features/chackout/view/widgets/app_bar.dart

import 'package:flutter/material.dart';
import '../../../../features/chackout/core/constant/const_var.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

AppBar bulidAppBar({required PageController controller}) {
  return AppBar(
    title: Text(
      titel()[controller.page!.round()],
      style: TextsStyle.bold19.copyWith(color: AppColors.grayscale950),
    ),
    centerTitle: true,
  );
}
