// components/products/view/home_products_view.dart

import 'package:flutter/material.dart';

class HomeProductsView extends StatelessWidget {
  const HomeProductsView({super.key});
  static const String routeName = 'HomeProductsView';
  static int index = 1;

  @override
  Widget build(BuildContext context) {
    // app bar title
    //serch text field
    //custom vertical list of products
    //best selling products
    return Container(
        child: const Center(
          child: Text("HomeProductsView"),
        ),
      
    );
  }
}
