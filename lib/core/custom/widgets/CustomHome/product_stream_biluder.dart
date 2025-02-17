// core/custom/widgets/widget/product_stream_biluder.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import '../../../../../core/custom/widgets/alert_error.dart';
import '../../../../../service/firebase/data/firebaseDataService.dart';


class ProductsSreamBuilder extends StatefulWidget {
  const ProductsSreamBuilder({super.key, required this.dataBody});
  final Widget Function(AsyncSnapshot<QuerySnapshot> snapshot) dataBody;

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
                return widget.dataBody(snapshot);
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




