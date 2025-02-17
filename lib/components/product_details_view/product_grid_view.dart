// components/product_details_view/product_grid_view.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_hup/components/products/widget/product_card.dart';

import '../../../core/models/product.dart';


class ProductGrid extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  const ProductGrid({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        //padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 163 / 214,
        ),
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          return ProductCard(
              product: Product.fromJson(
                  snapshot.data!.docs[index].data() as Map<String, dynamic>));
        });
  }
}
