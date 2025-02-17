// core/models/cart.dart

import 'package:store_hup/core/models/product.dart';

class Cart {
  final Product product;

  final num quantity;
  Cart({
    required this.product,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      product: Product(
        name: json['name'],
        dateofproduction: json['dateofproduction'],
        dateofexpire: json['dateofexpire'],
        quantity: json['quantity'],
        price: json['price'],
        description: json['description'],
        imageurl: json['imageurl'],
        id: json['id'],
        isOrganic: json['isOrganic'],
        calories: json['calories'],
      ),
      quantity: json['orderQuantity'],
    );
  }
}
