// features/cart/views/widgets/quantity_cart_control.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/cart/core/models/cart_item_entity.dart';
import '../../../../features/cart/core/state_management/cart_state/cart_cubit.dart';
import '../../../../core/custom/Style/custom_buttons_style.dart';
import '../../../../core/models/product.dart';
import '../../../../core/styles/color_style.dart';

import '../../../../core/styles/font_style.dart';

// ignore: must_be_immutable
class QuantityCartController extends StatefulWidget {
  QuantityCartController({
    super.key,
    this.quantity = 1,
    required this.product,
  });
  final Product product;

  num quantity = 1;

  @override
  State<QuantityCartController> createState() => _QuantityCartControllerState();
}

class _QuantityCartControllerState extends State<QuantityCartController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: CustomButtonsStyle.primeryButtonstyle.copyWith(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              ++widget.quantity;
            });
            context.read<CartCubit>().updateCart(CartItemEntity(
                  product: widget.product,
                  count: int.parse(widget.quantity.toString()),
                ));
          },
          icon: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 17,
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
              widget.quantity <= 1 ? null : --widget.quantity;
            });
            context.read<CartCubit>().updateCart(CartItemEntity(
                  product: widget.product,
                  count: int.parse(widget.quantity.toString()),
                ));
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
