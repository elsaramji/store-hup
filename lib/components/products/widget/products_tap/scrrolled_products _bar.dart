// components/products/widget/products_tap/scrrolled_products _bar.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_hup/components/products/core/custom/views/product_details%20_view.dart';

import '../../../../core/models/product.dart';
import '../../../../core/styles/color_style.dart';
import '../product_card.dart';

class ScrolledProductsBar extends StatelessWidget {
  const ScrolledProductsBar({super.key, required this.snapshot});
  final AsyncSnapshot<QuerySnapshot> snapshot;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 356 / 89,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final product = Product.fromJson(
                snapshot.data!.docs[index].data() as Map<String, dynamic>);
            return GestureDetector(
              onTap: () {
                Get.to(ProductDetailsView(product: product));
              },
              child: AspectRatio(
                aspectRatio: 64 / 89,
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Laodimage(product: product),
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
