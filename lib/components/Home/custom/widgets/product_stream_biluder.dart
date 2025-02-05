// components/Home/custom/widgets/product_stream_biluder.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/core/injection/Git_it.dart';

import '../../../../core/models/product.dart';
import '../../../../service/firebase/data/firebaseDataService.dart';
import '../../../products/widget/product_card.dart';

class ProductsSreamViwe {
  static Widget productsSreamViwe(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, BuildContext context) {
    if (snapshot.hasData) {
      {
        if (snapshot.data!.docs.isNotEmpty) {
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
                    product: Product.fromJson(snapshot.data!.docs[index].data()
                        as Map<String, dynamic>));
              });
        } else if (snapshot.data!.docs.isEmpty) {
          return AlertDialog(
            title: const Icon(
              Icons.warning_outlined,
              color: Colors.red,
            ),
            content: const Text('خطأ في الاتصال بقاعدة البيانات'),
            actions: <Widget>[
              TextButton(
                child: const Text('اغلاق'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        } else {
          return const Center(
              child: SpinKitCircle(
            color: Colors.green,
          ));
        }
      }
    } else {
      return const Center(
          child: SpinKitCircle(
        color: Colors.green,
      ));
    }
  }
}

class ProductsSreamBuilder extends StatefulWidget {
  const ProductsSreamBuilder({super.key});

  @override
  State<ProductsSreamBuilder> createState() => _ProductsSreamBuilderState();
}

class _ProductsSreamBuilderState extends State<ProductsSreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt<FirebaseDataService>().getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            {
              if (snapshot.data!.docs.isNotEmpty) {
                return SliverGrid.builder(
                    //padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      childAspectRatio: 163 / 214,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: Product.fromJson(snapshot.data!.docs[index]
                              .data() as Map<String, dynamic>));
                    });
              } else if (snapshot.data!.docs.isEmpty) {
                return SliverToBoxAdapter(
                  child: AlertDialog(
                    title: const Icon(
                      Icons.warning_outlined,
                      color: Colors.red,
                    ),
                    content: const Text('خطأ في الاتصال بقاعدة البيانات'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('اغلاق'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
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
