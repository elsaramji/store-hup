// features/cart/views/widgets/cart_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/cart/core/models/cart_item_entity.dart';
import '../../../../features/cart/core/state_management/cart_state/cart_cubit.dart';
import '../../../../features/cart/views/widgets/quantity_cart_control.dart';
import '../../../../features/products/widget/product_card.dart';
import '../../../../core/models/product.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

import '../../../../core/assets/assets_image.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const CartItem({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    final Product product = Product.fromJson(cartItemEntity.product.toMap());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      height: 95,
      child: Row(
        children: [
          Container(
              height: 92,
              width: 73,
              margin: const EdgeInsets.all(12),
              child: Laodimage(
                imageurl: product.imageurl,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.name, style: TextsStyle.bold13),
              Text(
                "${cartItemEntity.count} كم",
                style: TextsStyle.regular16.copyWith(
                  color: AppColors.orange500,
                ),
              ),
              const Spacer(),
              QuantityCartController(
                product: product,
                quantity: cartItemEntity.count,
              ),
            ],
          ),
          const Spacer(),
          Column(children: [
            IconButton(
                onPressed: () {
                  context.read<CartCubit>().removeFromCart(cartItemEntity);
                },
                icon: Image.asset(
                  Assets.assetsImagesTrash,
                  fit: BoxFit.contain,
                  height: 35,
                )),
            Text(
              " ${cartItemEntity.total} جنية",
              style: TextsStyle.bold16.copyWith(color: AppColors.orange500),
            ),
          ])
        ],
      ),
    );
  }
}
