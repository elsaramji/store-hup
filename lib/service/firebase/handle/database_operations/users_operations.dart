// service/firebase/handle/database_operations/users_operations.dart

import '../../../../../../core/injection/Git_it.dart';
import '../../../../../core/constant/end_points.dart';
import '../../../../../core/models/user_entity.dart';
import '../../../../core/exceptions/auth_excaption.dart';
import '../../data/firestore_service.dart';

class UserOperationsFirestore {
  static Future<void> addusertofirestore(
    Usermodel user,
  ) async {
    final _firestoreservice = getIt<FirestoreService>();

    try {
      return _firestoreservice.addUserData(
        path: EndPoints.usersEndPoints,
        user: user,
      );
    } catch (e) {
      AuthException.unKnownExceptionHandel(e);
    }
  }

  static Future<Usermodel?> fetchUserData({required String uid}) async {
    final _firestoreservice = getIt<FirestoreService>();
    var user = await _firestoreservice.fetchUserData(
        path: EndPoints.usersEndPoints, uid: uid);
    // check if user exist
    if (user != null) {
      return user;
    } else {
      return null
      ;
    }
  }
}
