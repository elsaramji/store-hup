// components/Home/views/home_view_body.dart

import 'package:flutter/material.dart';

import '../../../core/custom/widgets/custom_prodcut_searchbar.dart';
import '../custom/widgets/custom_bast_seller.dart';
import '../custom/widgets/custom_home_appbar.dart';
import '../custom/widgets/product_stream_biluder.dart';
import '../widgets/offers/offers_widget.dart';

class HomeViwebody extends StatelessWidget {
  const HomeViwebody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}