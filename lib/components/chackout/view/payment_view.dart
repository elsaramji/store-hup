// components/chackout/view/payment_view.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/view/widgets/card_form.dart';
import 'package:store_hup/components/chackout/view/widgets/save_card.dart';
import 'package:store_hup/components/chackout/view/widgets/visa_icon_mark.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 16),
        Text(
          "أختار طريقه الدفع المناسبه :",
          style: TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
        ),
        const SizedBox(height: 18),
        Text(
          'من فضلك اختر طريقه الدفع المناسبه لك.',
          style: TextsStyle.regular16.copyWith(color: AppColors.grayscale600),
        ),
        const SizedBox(height: 16),
        const VisaIconsMark(),
        const SizedBox(height: 16),
        const CardForm(),
        SaveCard()
      ])),
    );
  }
}
