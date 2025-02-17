// components/cart/core/services/firebase/data/cart_store_repo.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart'
    show CartItemEntity;
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/service/firebase/auth/auth_service.dart';

class CartStoreRepo {
  final CollectionReference firebase_collaction = FirebaseFirestore.instance
      .collection('cart${getIt<FirebaseAuthService>().getUserId()}');
  CartStoreRepo();

  void uploading(CartItemEntity cartItemEntity) async {
    await firebase_collaction
        .doc(cartItemEntity.code_item)
        .set(cartItemEntity.toMap());
  }

  void removed(CartItemEntity cartItemEntity) async{

    await firebase_collaction.doc(cartItemEntity.code_item).delete();
  }

  void updated(CartItemEntity cartItemEntity) async {
    await firebase_collaction
        .doc(cartItemEntity.code_item)
        .update(cartItemEntity.toMap());
  }
}
