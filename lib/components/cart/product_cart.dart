// components/cart/product_cart.dart
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  static const String routeName = 'ProductCart';
  static const int index = 2;
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("ProductCart"),
      ),
    );
  }
}
