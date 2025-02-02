// components/futures/Auth/signup/widgets/checkpolicies.dart
import 'package:flutter/material.dart';

import '../../../../../core/styles/color_style.dart';

class ChackPolices extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  const ChackPolices({
    this.onChanged,
    super.key,
  });

  @override
  State<ChackPolices> createState() => _ChackPolicesState();
}

class _ChackPolicesState extends State<ChackPolices> {
  bool chack = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
            value: chack,
            onChanged: (value) {
              chack = value!;
              widget.onChanged!(value);
              setState(() {});
            }),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(text: " من خلال إنشاء حساب ، "),
            TextSpan(
                text: "فإنك توافق على الشروط والأحكام الخاصة بنا",
                style: TextStyle(color: AppColors.green1700)),
          ])),
        ),
      ],
    );
  }
}
