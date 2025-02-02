// components/Home/custom/widgets/custom_button_items.dart
import 'package:flutter/material.dart';

import '../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../core/styles/font_style.dart';

class CustomButtonItem extends StatelessWidget {
  final String titel;
  final Color titelcolor;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const CustomButtonItem({
    super.key,
    required this.titel,
    required this.onPressed,
    this.style,
    required this.titelcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          titel,
          style: TextsStyle.bold16.copyWith(color: titelcolor),
        ),
      ),
      style: style ?? CustomButtonsStyle.itembuttonstyle,
    );
  }
}
