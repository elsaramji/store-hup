// core/custom/widgets/custom_or_divider.dart
import 'package:flutter/material.dart';

import '../../styles/color_style.dart';



class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          height: 44,
          color: AppColors.primaryLiner,
          thickness: 1,
        ),
        Positioned(
            right: 0,
            left: 0,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.primaryWhite,
              child: Text(
                "أو",
                style: TextStyle(color: AppColors.grayscale950),
              ),
            )),
      ],
    );
  }
}
