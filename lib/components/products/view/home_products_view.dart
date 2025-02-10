// components/products/view/home_products_view.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/products/core/product_details_view/widget/product_stream_biluder.dart';
import 'package:store_hup/core/custom/widgets/CustomHome/custom_prodcut_searchbar.dart';

import '../../../core/assets/assets_image.dart';
import '../../../core/custom/widgets/CustomHome/custom_Page_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';
import '../core/product_details_view/product_grid_view.dart';
import '../widget/products_tap/scrrolled_products _bar.dart';

class HomeProductsView extends StatelessWidget {
  const HomeProductsView({super.key});
  static const String routeName = 'HomeProductsView';

  @override
  Widget build(BuildContext context) {
    // app bar title
    //serch text field
    //custom vertical list of products
    //best selling products
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(
            child: CustomPageAppbar(
              pagetitel: "المنتجات",
              arrowback: false,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 16)),
          CustomProductSearchBar(onChanged: (value) {}),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 4)),
          const SliverToBoxAdapter(
            child: ProductsSortBar(),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8)),
          ProductsSreamBuilder(
            dataBody: (snapshot) {
              return ScrolledProductsBar(snapshot: snapshot);
            },
          ),
          ProductsSreamBuilder(dataBody: (snapshot) {
            return ProductGrid(snapshot: snapshot);
          })
        ]),
      ),
    );
  }
}

class ProductsSortBar extends StatelessWidget {
  const ProductsSortBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "منتجاتنا",
        style: TextsStyle.bold19.copyWith(color: AppColors.grayscale950),
      ),
      const Spacer(),
      Image.asset(
        Assets.assetsImagesArrowSwap,
        height: 24,
        width: 24,
      ),
    ]);
  }
}
