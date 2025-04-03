
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_hup/components/profile/core/models/user_enitiy.dart';
import 'package:store_hup/core/constant/end_points.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/service/firebase/auth/auth_service.dart';

class UserRepo{
 final CollectionReference firebase_collaction_users = FirebaseFirestore
      .instance
      .collection(EndPoints.usersEndPoints)
      .doc(getIt<FirebaseAuthService>().getUserId())
      .collection('data');

      updatauserdata({required UserEnitiy userEnitiy})async{
        await firebase_collaction_users.doc(userEnitiy.id).set(userEnitiy.toJson());
      }
}