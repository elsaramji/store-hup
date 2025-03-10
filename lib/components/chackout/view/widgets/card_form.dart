// components/chackout/view/widgets/card_form.dart
import 'package:flutter/material.dart';
import 'package:store_hup/core/custom/widgets/custom_text_filed.dart';

class CardForm extends StatelessWidget {
  const CardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformField(
            keybordetepy: TextInputType.name, hinttext: "اسم حامل البطاقه", onChanged: (value) {  },),
        const SizedBox(height: 6),
        CustomTextformField(
            keybordetepy: TextInputType.number, hinttext: "رقم البطاقه", onChanged: (value) {  },),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: CustomTextformField(
                  keybordetepy: TextInputType.number, hinttext: "MM/YY"),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: CustomTextformField(
                  keybordetepy: TextInputType.number, hinttext: "CVV"),
            ),
          ],
        ),
      ],
    );
  }
}
