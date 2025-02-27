// components/products/service/firebase/products_firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:store_hup/core/errors/failure.dart';
import 'package:store_hup/core/models/product.dart';

class ProductsFirestoreService {
    CollectionReference products =
      FirebaseFirestore.instance.collection('products');
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

  Future<List<Map<String, dynamic>>> getProduct() async {
    var snapshot = await products.get();
    return snapshot.docs.map((e) => e.data() as Map<String, dynamic>).toList();
  }
}