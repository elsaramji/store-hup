// components/Home/views/home_view_body.dart

import 'package:flutter/material.dart';

import '../../../core/custom/widgets/custom_prodcut_searchbar.dart';
import '../../products/core/product_details_view/product_grid_view.dart';
import '../custom/widgets/custom_bast_seller.dart';
import '../custom/widgets/custom_home_appbar.dart';
import '../../products/core/product_details_view/widget/product_stream_biluder.dart';
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
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const CustomHomeAppBar(
              userName: "Mahmoud",
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            CustomProductSearchBar(
              onChanged: (value) {},
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            // body Section
            // offers
            SliverToBoxAdapter(
                child: AspectRatio(
              aspectRatio: 342 / 158,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const OffersItem(),
                itemCount: 5,
              ),
            )),
            //bast seller
            const BastSellerBar(),
            // Products
            ProductsSreamBuilder(
              dataBody: (snapshot) {
                return ProductGrid(snapshot: snapshot);
              },
            ),
          ])),
    );
  }
}
