// service/database/database_services.dart
import '../../core/models/user_entity.dart';

class DatabaseServices {
  void addData({required String path, required Map<String, dynamic> data}) {}
  void addUserData({required String path, required Usermodel user}) {}
  void futchdata({required String path}) {}
  Future<Usermodel?> fetchUserData(
      {required String path, required String uid}) async {
    return Usermodel.fromMap({});
  }
 

}
