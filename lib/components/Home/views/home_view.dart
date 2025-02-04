// components/Home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/Home/views/home_view_body.dart';
import 'package:store_hup/components/navigation/logic/solamon_logic.dart';
import 'package:store_hup/components/navigation/view/solamon_navigation_bar.dart';

class HomeMainView extends StatefulWidget {
  static const String id = 'HomeView';
  int selectedIndex = 0;
  Widget body = HomeViwebody();

  HomeMainView({super.key});

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  Widget build(BuildContext context) {
    var solamonNavigationBar = SolamonNavigationBar(
      selectedIndex: widget.selectedIndex,
      onTap: (index) {
        setState(() {
          widget.selectedIndex = index;
        });
        SolamonLogic.bodybuilder(widget.selectedIndex, widget); 
      },
    );
    return Scaffold(
        body: widget.body, bottomNavigationBar: solamonNavigationBar);
  }
}


/*
        Column(children: [
          // bar Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 12),
                CustomProductSearchBar(
                  onChanged: (value) {},
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          // body Section
          
          // offers
          OffersScroll(),
          //bast seller
          BastSellerBar(),
          // Products
          Expanded(child: BestSellerManu(products: products)),
          // Bottom Section
        ]),
      )),
    );
  }}
*/
