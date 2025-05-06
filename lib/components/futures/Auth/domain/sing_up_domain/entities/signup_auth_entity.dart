import 'package:dartz/dartz.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_up_domain/errors/signup_errors_entity.dart';

abstract class SignupAuthEntity {
  Future<Either<SignupErrorsEntity, UserEntity>> signupWithEmailAndPassword(
      UserEntity userEntity, String password);
}
