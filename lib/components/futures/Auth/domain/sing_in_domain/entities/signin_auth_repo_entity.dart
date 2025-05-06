import 'package:dartz/dartz.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/error/signin_errors_entity.dart';

abstract class SigninAuthRepoEntity {
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithGoogle();
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithFacebook();
}
