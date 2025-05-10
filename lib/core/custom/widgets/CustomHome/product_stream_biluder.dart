// core/custom/widgets/CustomHome/product_stream_biluder.dart
/*

// core/custom/widgets/CustomHome/product_stream_biluder.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/features/product_details_view/product_grid_view.dart';
import 'package:store_hup/features/products/widget/products_tap/scrrolled_products%20_bar.dart';

import '../../../../../core/custom/widgets/alert_error.dart';

class ProductsSreamBuilderGrid extends StatefulWidget {
  final Stream<QuerySnapshot<Object?>> stream;
  const ProductsSreamBuilderGrid({super.key, required this.stream});

  @override
  State<ProductsSreamBuilderScroll> createState() => _ProductsSreamBuilderScrollState();
}

class _ProductsSreamBuilderScrollState extends State<ProductsSreamBuilderScroll> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            {
              if (snapshot.data!.docs.isNotEmpty) {
                return ProductGrid(snapshot: snapshot);
              } else if (snapshot.data!.docs.isEmpty) {
                return const AlertError();
              } else {
                return const SliverToBoxAdapter(
                  child: Center(
                      child: SpinKitCircle(
                    color: Colors.green,
                  )),
                );
              }
            }
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                  child: SpinKitCircle(
                color: Colors.green,
              )),
            );
          }
        });
  }
}



class ProductsSreamBuilderScroll extends StatefulWidget {
  final Stream<QuerySnapshot<Object?>> stream;
  const ProductsSreamBuilderScroll({super.key, required this.stream});

  @override
  State<ProductsSreamBuilderScroll> createState() => _ProductsSreamBuilderScrollState();
}

class _ProductsSreamBuilderGridState extends State<ProductsSreamBuilderScroll> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            {
              if (snapshot.data!.docs.isNotEmpty) {
                return  ScrolledProductsBar(snapshot: snapshot,);
              } else if (snapshot.data!.docs.isEmpty) {
                return const AlertError();
              } else {
                return const SliverToBoxAdapter(
                  child: Center(
                      child: SpinKitCircle(
                    color: Colors.green,
                  )),
                );
              }
            }
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                  child: SpinKitCircle(
                color: Colors.green,
              )),
            );
          }
        });
  }
}*/