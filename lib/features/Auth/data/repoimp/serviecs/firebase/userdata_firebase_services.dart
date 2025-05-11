import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../domain/entities/user_data_errors_entity.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repos/user_data_repo/user_data_store_repo.dart';
import '../../../models/user_model.dart';

class UserdataFirebaseServicesImp implements UserDataStoreRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<UserDataErrorsEntity, bool>> addUserData(
      UserEntity user) async {
    try {
      bool isExist = await isNotExist(user)
          .then((value) => value.fold((l) => false, (r) => r));
      if (isExist) {
        await firestore.collection('users').doc(user.id).set(
              UserModel.toObject(user).toJson(),
            );
        return right(true);
      } else {
        return left(UserDataErrorsEntity(
          errorMassage: "المستخدم موجود مسبقا",
        ));
      }
    } catch (e) {
      return left(UserDataErrorsEntity(
        errorMassage: "حدث خطا اثناء اضافة بيانات المستخدم",
      ));
    }
  }

  @override
  Future<Either<UserDataErrorsEntity, bool>> isNotExist(UserEntity user) async {
    try {
      final doc = await firestore.collection('users').doc(user.id).get();
      if (doc.exists) {
        return right(false);
      } else {
        return right(true);
      }
    } catch (e) {
      return left(UserDataErrorsEntity(
        errorMassage: "حدث خطا اثناء التحقق من وجود المستخدم",
      ));
    }
  }

  @override
  Future<Either<UserDataErrorsEntity, UserEntity>> fetchUserData(String uid) {
    return firestore.collection('users').doc(uid).get().then((value) {
      if (value.exists) {
        final data = value.data()!;
        final user = UserModel.fromJson(data);
        return right(user);
      } else {
        return left(UserDataErrorsEntity(
          errorMassage: "المستخدم غير موجود",
        ));
      }
    });
  }
}
