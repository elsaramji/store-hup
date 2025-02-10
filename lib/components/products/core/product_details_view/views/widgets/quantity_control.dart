// components/products/core/custom/views/widgets/quantity_control.dart

import 'package:flutter/material.dart';

import '../../../../../../core/custom/Style/custom_buttons_style.dart' show CustomButtonsStyle;
import '../../../../../../core/styles/color_style.dart' show AppColors;
import '../../../../../../core/styles/font_style.dart';

// ignore: must_be_immutable
class QuantityController extends StatefulWidget {
  
  QuantityController({
    super.key,
  });

  int quantity = 1;
  int get getquantity => quantity;
  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

class _QuantityControllerState extends State<QuantityController> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: CustomButtonsStyle.primeryButtonstyle.copyWith(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
          ),
          onPressed: () {
            setState(() {
              widget.quantity++;
            });
          },
          icon: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          "${widget.quantity}",
          style: TextsStyle.bold19.copyWith(color: AppColors.grayscale950),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.quantity--;
            });
          },
          child: const Icon(
            Icons.remove,
            color: AppColors.grayscale200,
          ),
        ),
      ],
    );
  }
}

