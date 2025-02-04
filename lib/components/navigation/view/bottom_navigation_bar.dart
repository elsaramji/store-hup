// components/navigation/view/bottom_navigation_bar.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/Home/views/home_view.dart';
import 'package:store_hup/components/cart/product_cart.dart';
import 'package:store_hup/components/products/view/home_products_view.dart';
import 'package:store_hup/components/profile/user_profile.dart';

import '../../../core/models/navigation_icon_entity.dart';
import '../widget/navigation_item.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  CustomBottomNavigationBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<String> goto = [
    HomeMainView.id,
    HomeProductsView.routeName,
    ProductCart.routeName,
    UserProfile.routeName,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.08,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 7,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: NavigationIconEntity.navigationItmesEntity
              .asMap()
              .entries
              .map((e) {
            int index = e.key;
            NavigationIconEntity navigationIconEntity = e.value;
            return GestureDetector(
              onTap: () {
                widget.selectedIndex = index;
                Navigator.popAndPushNamed(context, goto[index]);
                setState(() {});
              },
              child: CustomNavigtionItmes(
                navigationIconEntity: navigationIconEntity,
                isactive: widget.selectedIndex == index,
              ),
            );
          }).toList(),
        ));
  }
}
