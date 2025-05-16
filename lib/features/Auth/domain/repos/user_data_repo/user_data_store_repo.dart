import 'package:dartz/dartz.dart';
import '../../entities/user_data_errors_entity.dart';
import '../../entities/user_entity.dart';

abstract class UserDataStoreRepo {
  Future<Either<UserDataErrorsEntity, bool>> addUserData(UserEntity user);
  Future<Either<UserDataErrorsEntity, bool>> isNotExist(UserEntity user);
  Future<Either<UserDataErrorsEntity, UserEntity>> fetchUserData(String uid);
}
