// service/firebase/data/firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/exceptions/auth_excaption.dart';
import '../../../core/models/user_entity.dart';
import '../../database/database_services.dart';

class FirestoreService extends DatabaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // add data to fireStore database
  @override
  void addUserData({required String path, required Usermodel user}) {
    try {
      _firestore.collection(path).doc(user.uid).set(user.toMap());
    } catch (e) {
      AuthException.unKnownExceptionHandel(e);
    }
  }

  Future<bool> isnotExist(
      {required String path, required String? email}) async {
    final email_exist = await _firestore
        .collection(path)
        .where("email", isEqualTo: email)
        .get();

    return email_exist.docs.asMap().isEmpty;

    /*
*/
  }

  Future<bool> isExist({required String path, required String uid}) async {
    // check if user exist
    final result = await _firestore.collection(path).doc(uid).get();
    return result.exists;
  }

  @override
  Future<Usermodel?> fetchUserData(
      {required String path, required String uid}) async {
    var data = await _firestore.collection(path).doc(uid).get();
    if (!data.exists) {
      return Usermodel.fromMap(data.data()!);
    }
    return Usermodel.fromMap({});
  }
}
