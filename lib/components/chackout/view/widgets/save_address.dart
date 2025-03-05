// components/chackout/view/widgets/save_address.dart

import 'package:flutter/material.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class SaveAddress extends StatelessWidget {
  const SaveAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        Text(
          "حفظ العنوان",
          style: TextsStyle.semibold13.copyWith(color: AppColors.grayscale400),
        )
      ],
    );
  }
}
