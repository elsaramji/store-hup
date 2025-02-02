// components/cart/product_cart.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/navigation/view/bottom_navigation_bar.dart';

class ProductCart extends StatelessWidget {
  static const String routeName = 'ProductCart';
  static const int index = 2;
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: index,),
      body: Container(
        child: Center(
          child: Text("ProductCart"),
        ),
      ),
    );
  }
}
