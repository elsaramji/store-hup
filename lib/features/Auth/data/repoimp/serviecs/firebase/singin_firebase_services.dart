import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../domain/entities/signin_errors_entity.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repos/sing_in_repo/signin_auth_repo_entity.dart';
import '../../../models/signin_error_mode.dart';
import '../../../models/user_model.dart';
import 'userdata_firebase_services.dart';

class SigninFirebaseServicesImp extends SigninAuthRepoEntity {
  UserdataFirebaseServicesImp userDataFirebaseServicesObj =
      UserdataFirebaseServicesImp();
  @override
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final firbaseCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(UserModel.fromFirebase(firbaseCredential.user!));
    } on FirebaseAuthException catch (e) {
      return left(SigninErrorModel.fromFirebaseAuthException(e));
    } catch (e) {
      return left(SigninErrorModel(
          errorMassage: "ربما لم تتكمل عملية التسجيل الرجاء اعادة المحاولة"));
    }
  }

  @override
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithFacebook() async {
    LoginResult? result;
    try {
      result = await FacebookAuth.instance.login();
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await userDataFirebaseServicesObj.addUserData(
        UserModel.fromFirebase(userCredential.user!),
      );
      return right(UserModel.fromFirebase(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      return left(SigninErrorModel.fromFirebaseAuthException(e));
    } catch (e) {
      log(e.toString());
      return left(SigninErrorModel(
          errorMassage: "ربما لم تتكمل عملية التسجيل الرجاء اعادة المحاولة"));
    }
  }

  @override
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      log(userCredential.user!.photoURL.toString());
      await userDataFirebaseServicesObj.addUserData(
        UserModel.fromFirebase(userCredential.user!),
      );
      return right(UserModel.fromFirebase(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      return left(SigninErrorModel.fromFirebaseAuthException(e));
    } catch (e) {
      log(e.toString());
      return left(SigninErrorModel(
          errorMassage: 'ربما لم تتكمل عملية التسجيل الرجاء اعادة المحاولة'));
    }
  }
}
