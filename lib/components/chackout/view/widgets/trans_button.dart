// components/chackout/view/trans_button.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/core/constant/const_var.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
import 'package:store_hup/core/custom/widgets/custom_social_button.dart';
import 'package:store_hup/core/styles/color_style.dart';

class TransButtonsBuilder extends StatelessWidget {
  const TransButtonsBuilder({
    super.key,
    required this.controller,
    required this.index,
  });

  final PageController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: index != 0,
            child: Expanded(
              child: CustomSocialButton(
                title: "السابق",
                onTouch: () {
                  if (index > 0) {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: CustomButton(
              titel: index == titel().length - 1 ? "تاكيد" : "التالي",
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              titelcolor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
