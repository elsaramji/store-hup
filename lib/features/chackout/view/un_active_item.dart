// features/chackout/view/un_active_item.dart
import 'package:flutter/material.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class UnActiveSelcetPaymentData extends StatelessWidget {
  final String titel, suptitel, trailing;
  const UnActiveSelcetPaymentData(
      {super.key,
      required this.titel,
      required this.suptitel,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(
          titel,
          style: TextsStyle.semibold13.copyWith(color: AppColors.grayscale950),
        ),
        subtitle: Text(suptitel, style: TextsStyle.regular13),
        trailing: Text(
          trailing,
          style: TextsStyle.semibold13.copyWith(color: AppColors.primaryColor),
        ),
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const CircleAvatar(
            backgroundColor: AppColors.primaryWhite,
            radius: 9,
          ),
        ),
      ),
    );
  }
}