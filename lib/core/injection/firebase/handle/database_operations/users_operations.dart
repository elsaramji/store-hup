// service/firebase/handle/database_operations/users_operations.dart

import '../../data/firebaseDataService.dart';

import '../../../../../../core/constant/end_points.dart';
import '../../../../../../core/models/user_entity.dart';
import '../../../../exceptions/auth_excaption.dart';

class UserOperationsFirestore {
 
  static Future<void> addusertofirestore(
    Usermodel user,
  ) async {
    try {
      return FirebaseDataService().addUserData(
        path: EndPoints.usersEndPoints,
        user: user,
      );
    } catch (e) {
      AuthException.unKnownExceptionHandel(e);
    }
  }

  static Future<Usermodel?> fetchUserData({required String uid}) async {
    var user = await FirebaseDataService().fetchUserData(
         uid: uid);
    // check if user exist
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }
}
