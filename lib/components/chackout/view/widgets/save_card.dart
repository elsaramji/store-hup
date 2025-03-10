// components/chackout/view/widgets/save_card.dart

import 'package:flutter/material.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

// ignore: must_be_immutable
class SaveCard extends StatefulWidget {
  bool checkBox = false;
  SaveCard({
    super.key,
  });

  @override
  State<SaveCard> createState() => _SaveCardState();
}

class _SaveCardState extends State<SaveCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: widget.checkBox,
            onChanged: (value) {
              setState(() {
                widget.checkBox = value!;
              });
            }),
        const SizedBox(
          width: 4,
        ),
        Text(
          'احفظ بطاقتي',
          style: TextsStyle.regular13.copyWith(color: AppColors.grayscale600),
        )
      ],
    );
  }
}
