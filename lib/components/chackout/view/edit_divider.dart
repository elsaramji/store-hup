// components/chackout/view/edit_divider.dart
import 'package:flutter/material.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class EditDivder extends StatelessWidget {
  final String title;

  const EditDivder({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title,
          style: TextsStyle.bold13.copyWith(color: AppColors.grayscale950)),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.edit,
            color: AppColors.grayscale400,
          ),
          Text(
            "تغيير",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale400),
          ),
        ],
      )
    ]);
  }
}
