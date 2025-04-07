// components/cart/core/services/firebase/data/cart_store_repo.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/core/constant/end_points.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/core/injection/firebase/auth/auth_service.dart';

class CartFirebaseRepo {
  CartFirebaseRepo();
  final CollectionReference firebase_collaction = FirebaseFirestore.instance
      .collection(EndPoints.usersEndPoints)
      .doc(getIt<FirebaseAuthService>().getUserId())
      .collection(EndPoints.cartEndPoints);
  void uploading(CartItemEntity cartItemEntity) async {
    await firebase_collaction
        .doc(cartItemEntity.code_item)
        .set(cartItemEntity.toMap());
  }

  void removed(CartItemEntity cartItemEntity) async {
    await firebase_collaction.doc(cartItemEntity.code_item).delete();
  }

  void updated(CartItemEntity cartItemEntity) async {
    await firebase_collaction
        .doc(cartItemEntity.code_item)
        .update(cartItemEntity.toMap());
  }

  Stream<QuerySnapshot> getCart() {
    return firebase_collaction.snapshots();
  }

  num calculateTotal() {
    num total = 0;
    firebase_collaction.snapshots().listen((event) {
      event.docs.forEach((element) {
        total += CartItemEntity.fromMap(element.data() as Map<String, dynamic>)
            .total;
      });
    });
    return total;
  }
}
