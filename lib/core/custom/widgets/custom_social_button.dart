// core/custom/widgets/custom_social_button.dart
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../styles/color_style.dart';
import '../../styles/font_style.dart';
import '../Style/custom_buttons_style.dart';

class CustomSocialButton extends StatelessWidget {
  final String title;
  final String? iconphat;
  final void Function()? onTouch;
  const CustomSocialButton({
    super.key,
    required this.title,
    this.iconphat,
    this.onTouch,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: CustomButtonsStyle.socailAuthButtonstyle,
        onPressed: onTouch,
        child: SizedBox(
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  child: SvgPicture.asset(iconphat ?? ''),
                  visible: iconphat != null),
              Spacer(),
              Text(
                title,
                style: TextsStyle.semibold13
                    .copyWith(color: AppColors.grayscale900),
              ),
              Spacer(),
            ],
          ),
        ));
  }
}
