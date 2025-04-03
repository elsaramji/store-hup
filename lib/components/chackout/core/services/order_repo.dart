// components/chackout/core/services/order_repo.dart

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';
import 'package:store_hup/core/constant/end_points.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/service/database/presence.dart';
import 'package:store_hup/service/firebase/auth/auth_service.dart';

class OrderRepo {
  final CollectionReference firebase_collaction =
      FirebaseFirestore.instance.collection('orders');
  final CollectionReference firebase_collaction_users = FirebaseFirestore
      .instance
      .collection(EndPoints.usersEndPoints)
      .doc(getIt<FirebaseAuthService>().getUserId())
      .collection('orders');
  static String generateOrderId() {
    // Get the current date
    final DateTime now = DateTime.now();
    final String datePart =
        "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";

    // Generate a random 4-digit number
    final Random random = Random();
    final String uniquePart = random.nextInt(10000).toString().padLeft(4, '0');
    String orderId = datePart + uniquePart;

    // Combine parts to create the product code
    return orderId;
  }

  Future<void> uploading(OrderModel orderModel) async {
    String orderId = generateOrderId();
    orderModel.id = orderId;
    Preferences.setString("orderId", orderId);
    await firebase_collaction.doc(orderId).set(orderModel.toMap());
    await firebase_collaction_users.doc(orderId).set(orderModel.toMap());
  }

  Future<void> update(OrderModel orderModel) async {
    await firebase_collaction
        .doc(Preferences.getStringfromShared("orderId"))
        .update(orderModel.toMap());
  }

  Future getOrder() async {
    await firebase_collaction
        .doc(Preferences.getStringfromShared("orderId"))
        .get();
  }
}
