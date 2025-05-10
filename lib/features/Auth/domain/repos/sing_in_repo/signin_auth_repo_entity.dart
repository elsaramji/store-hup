import 'package:dartz/dartz.dart';

import '../../entities/signin_errors_entity.dart';
import '../../entities/user_entity.dart';

abstract class SigninAuthRepoEntity {
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithGoogle();
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithFacebook();
}
