import 'package:dartz/dartz.dart';
import '../../entities/signup_errors_entity.dart';
import '../../entities/user_entity.dart';

abstract class SignupAuthEntity {
  Future<Either<SignupErrorsEntity, UserEntity>> signupWithEmailAndPassword(
      UserEntity userEntity, String password);
}
