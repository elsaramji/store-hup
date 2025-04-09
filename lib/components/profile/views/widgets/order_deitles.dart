import 'package:flutter/material.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/core/styles/color_style.dart';

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
        child: Image.network(
          cartItemEntity.product.imageurl,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(cartItemEntity.product.name),
      subtitle: Text('الكمية ${cartItemEntity.count}'),
      trailing: Text(
        '${double.parse(cartItemEntity.product.price) * cartItemEntity.count} \$',
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
