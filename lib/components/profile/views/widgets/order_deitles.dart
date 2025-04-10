import 'package:flutter/material.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/products/widget/product_card.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class Orderdeteils extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const Orderdeteils({
    required this.cartItemEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.green50,
          child: Laodimage(
            imageurl: cartItemEntity.product.imageurl,
          )),
      title: Text(cartItemEntity.product.name),
      subtitle: Text('الكمية ${cartItemEntity.count}'),
      trailing: Text(
        '${double.parse(cartItemEntity.product.price) * cartItemEntity.count} \$',
        style: TextsStyle.bold16.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
