import 'package:store_hup/core/models/user_entity.dart';
import 'package:store_hup/service/firebase/data/firebaseDataService.dart';

class UserData {
 static Future<Usermodel?> futchUserdataFromFirebase(String uid) async {
    // Fetch user data from Firebase using the provided uid
    FirebaseDataService firebaseDataService = FirebaseDataService();
    Usermodel? userData =
        await firebaseDataService.fetchUserData(uid: uid);
    if (userData != null) {
      return userData;
    } else {
      // Handle the case where user data is not found
      return null;
    }
  }
}
