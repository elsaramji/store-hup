// components/products/view/home_products_view.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/navigation/view/bottom_navigation_bar.dart';

class HomeProductsView extends StatelessWidget {
  const HomeProductsView({super.key});
  static const String routeName = 'HomeProductsView';
  static int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: index,),
      body: Container(
        child: Center(
          child: Text("HomeProductsView"),
        ),
      ),
    );
  }
}
