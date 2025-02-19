// components/product_details_view/product_grid_view.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/cart/core/state_management/cart_state/cart_cubit.dart';
import 'package:store_hup/components/products/widget/product_card.dart';

import '../../../core/models/product.dart';

class ProductGrid extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  bool check_state = false;
  ProductGrid({
    super.key,
    required this.snapshot,
  });

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAdded) {
          setState(() {
            widget.check_state = true;
          });
        }
      },
      child: SliverGrid.builder(
          //padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: 163 / 214,
          ),
          itemCount: widget.snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return ProductCard(
                add: () {
                  context.read<CartCubit>().addToCart(
                      CartItemEntity(
                          product: Product.fromJson(
                              widget.snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>)),
                      context);
                },
                product: Product.fromJson(widget.snapshot.data!.docs[index]
                    .data() as Map<String, dynamic>));
          }),
    );
  }
}
