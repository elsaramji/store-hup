// components/chackout/core/services/order_repo.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';

class OrderRepo {
  final CollectionReference firebase_collaction =
      FirebaseFirestore.instance.collection('orders');

  Future<void> uploading(OrderModel orderModel, String orderId) async {
    await firebase_collaction.doc(orderId).set(orderModel.toMap());
  }

  Future<void> update(OrderModel orderModel) async {
    await firebase_collaction
        .doc()
        .update(orderModel.toMap());
  }
}
