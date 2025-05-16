import 'dart:developer';

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

// strage patnren

abstract class Auth {
  Signin signin();
}

abstract class Signin {
  SigninWithEmailAndPassword signinWithEmailAndPassword();
}

abstract class SigninWithEmailAndPassword {
  void login(String email, String password);
}

class SiginWithEmailAndPasswordImpApi implements SigninWithEmailAndPassword {
  @override
  void login(String email, String password) {
    log("Login using API: $email / $password");
  }
}

class SiginWithEmailAndPasswordImpFirebase implements SigninWithEmailAndPassword {
  @override
  void login(String email, String password) {
    log("Login using Firebase: $email / $password");
  }
}

class SigninImp implements Signin {
  final SigninWithEmailAndPassword strategy;

  SigninImp(this.strategy);

  @override
  SigninWithEmailAndPassword signinWithEmailAndPassword() => strategy;
}

class AuthImp implements Auth {
  final Signin signinStrategy;

  AuthImp(this.signinStrategy);

  @override
  Signin signin() => signinStrategy;
}