// components/Home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/Home/custom/widgets/custom_bast_seller.dart';
import 'package:store_hup/components/Home/custom/widgets/product_stream_biluder.dart';

import '../../../core/custom/widgets/CustomHome/custom_prodcut_searchbar.dart';
import '../../navigation/view/bottom_navigation_bar.dart';
import '../custom/widgets/custom_home_appbar.dart';
import '../widgets/offers/offers_scroll.dart';

class HomeView extends StatelessWidget {
  static const String id = 'HomeView';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              CustomHomeAppBar(
                userName: "Mahmoud",
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              CustomProductSearchBar(
                onChanged: (value) {},
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              // body Section
              // offers
              SliverToBoxAdapter(
                  child: AspectRatio(
                aspectRatio: 342 / 158,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => OffersItem(),
                  itemCount: 5,
                ),
              )),
              //bast seller
              BastSellerBar(),
              // Products
              ProductsSreamBuilder(),
            ])),
      ),
    );
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
