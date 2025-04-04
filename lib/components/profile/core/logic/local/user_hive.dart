import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:store_hup/core/constant/end_points.dart';

class UserHive {
  static Box userBox = Hive.box(EndPoints.usersEndPoints);

  static addUserData(
      {required String uid, required Map<String, dynamic> user}) {
    userBox.put(uid, user);
  }

  static Map<String, dynamic>? getUserData({required String uid}) {
    // check if user exist
    if (!userBox.containsKey(uid)) {
      return null;
    }
    log("User Exist${userBox.get(uid)}");
    return userBox.get(uid) as Map<String, dynamic>?;
  }
}
