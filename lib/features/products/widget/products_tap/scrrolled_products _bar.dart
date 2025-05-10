// features/products/widget/products_tap/scrrolled_products _bar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/product_details_view/views/product_details%20_view.dart';

import '../../../../core/models/product.dart';
import '../../../../core/styles/color_style.dart';
import '../product_card.dart';

class ScrolledProductsBar extends StatelessWidget {
  const ScrolledProductsBar({super.key, required this.snapshot});
  final List<Map<String, dynamic>> snapshot;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 356 / 89,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            final product = Product.fromJson(snapshot[index]);
            return GestureDetector(
              onTap: () {
                Get.to(ProductDetailsView(product: product));
              },
              child: AspectRatio(
                aspectRatio: 64 / 89,
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Laodimage(
                      imageurl: product.imageurl,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                  Text(
                    product.name.length >= 7
                        ? product.name.substring(0, 6) + "..."
                        : product.name,
                    style: const TextStyle(
                        color: AppColors.grayscale950, fontSize: 16),
                  ),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
