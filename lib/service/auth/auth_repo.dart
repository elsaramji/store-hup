// service/auth/auth_repo.dart

import 'package:dartz/dartz.dart';


import '../../core/errors/failure.dart';
import '../../core/models/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, Usermodel>> createEmailWithemailandpassword(
      {required String email, required String password, required String name});

  Future<Either<Failure, Usermodel>> signInWithEmailandpassword(
      {required String email, required String password});

  Future<Either<Failure, Usermodel>> signinWithGoogle();
  Future<Either<Failure, Usermodel>> signinWithFacebook();
  Future<Either<Failure, Usermodel>> signinWithApple();
  Future<Either<Failure, void>> forgetPassword({required String email});
  bool isLoggedIn();
  Future<Either<Failure, void>> signOut();
  saveUserId(Usermodel user);
  getUserId();
}
