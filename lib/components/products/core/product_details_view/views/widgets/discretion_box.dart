// components/products/core/custom/views/widgets/discretion_box.dart
import 'package:flutter/material.dart';

import '../../../../../../core/models/product.dart';
import '../../../../../../core/styles/color_style.dart';
import '../../../../../../core/styles/font_style.dart';

class DescriptionBox extends StatefulWidget {
  const DescriptionBox({super.key, required this.product});

  final Product product;

  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  int lenght_details = 150;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (lenght_details == 150) {
              lenght_details = widget.product.description.length;
            } else {
              lenght_details = 150;
            }
          });
        },
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: widget.product.description.length >= lenght_details
                ? widget.product.description.substring(0, lenght_details)
                : widget.product.description,
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale400),
          ),
          TextSpan(
            text: widget.product.description.length == lenght_details
                ? ""
                : " المزيد...",
            style: TextsStyle.regular16.copyWith(color: AppColors.orange500),
          ),
        ])));
  }
}
