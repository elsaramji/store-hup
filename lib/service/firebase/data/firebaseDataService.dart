// service/firebase/data/firebaseDataService.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/service/firebase/auth/auth_service.dart';

import '../../../core/errors/failure.dart';
import '../../../core/models/product.dart';

class FirebaseDataService {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  CollectionReference cart = FirebaseFirestore.instance
      .collection('cart${getIt<FirebaseAuthService>().getUserId()}');

  Future<Either<Failure, bool>> addToCart(
      {required Product product, required num quantity}) async {
    try {
      if (quantity > double.parse(product.quantity)) {
        return left(Failure("لا يوجد كمية كافية"));
      } else if (quantity <= 0) {
        return left(Failure("لا يمكن ان يكون الكمية اقل من 0"));
      }
      Map<String, dynamic> productmap = product.toMap();
      productmap['orderQuantity'] = quantity;
      cart
          .doc(product.id)
          .set(productmap); //await doc(product.id).set(productmap);

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> removeFromCart({required String id}) async {
    try {
      await cart.doc(id).delete();
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<QuerySnapshot<Object?>> getCart() {
    return cart.snapshots();
  }

  Future<Either<Failure, bool>> addProduct({required Product product}) async {
    try {
      Map<String, dynamic> productmap = product.toMap();
      await products.doc(product.id).set(productmap);

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> updateProduct(
      {required Product product, required String id}) async {
    try {
      Map<String, dynamic> productmap = product.toMap();
      await products.doc(id).update(productmap);
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteProduct({required String id}) async {
    try {
      await products.doc(id).delete();
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<QuerySnapshot> getProduct() {
    return products.snapshots();
  }
}
