// service/firebase/auth/auth_service.dart
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/failure.dart';
import '../../../core/exceptions/auth_excaption.dart';
import '../../../core/models/user_entity.dart';
import '../../auth/auth_repo.dart';
import '../../database/presence.dart';
import '../handle/database_operations/users_operations.dart';

// Auth Service Class For Firebase
class FirebaseAuthService extends AuthRepo {
  Usermodel? users;
  Stream<User?>? userStream;
  // sign up with email and password
  @override
  Future<Either<Failure, Usermodel>> createEmailWithemailandpassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      // credential value

      final credential =
          // create user with email and password in firebase
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(name);
      users = Usermodel.fromFirebase(credential.user!, name: name);
      // add user to fireStore database
      UserOperationsFirestore.addusertofirestore(users!);

      // return user credential  from firebase
      return right(users!);
    }
    // catch firebase auth exception
    on FirebaseAuthException catch (e) {
      // return firebase auth exception
      return left(AuthException.firebaseAuthExceptionHandel(e));
    }
    // catch unknown exception
    catch (e) {
      // return unknown exception and failure
      return left(AuthException.unKnownExceptionHandel(e));
    }
  }

  // sign in with email and password
  @override
  Future<Either<Failure, Usermodel>> signInWithEmailandpassword(
      {required String email, required String password}) async {
    try {
      // credential value
      final credential = await FirebaseAuth.instance
          // sign in with email and password in firebase
          .signInWithEmailAndPassword(email: email, password: password);

      users = Usermodel.fromFirebase(credential.user!);

      saveUserId(users!);

      // return user credential from firebase
      return right(users!);
    }
    // catch firebase auth exception
    on FirebaseAuthException catch (e) {
      log("firebase auth exception ${e.code}");

      // return firebase auth exception
      return left(AuthException.firebaseAuthExceptionHandel(e));
    }
    // catch unknown exception
    catch (e) {
      log("$e");
      // return unknown exception and failure
      return left(Failure("خطأ غير متوقع"));
    }
  }

  // sign in with google
  @override
  Future<Either<Failure, Usermodel>> signinWithGoogle() async {
    try {
      // sign in with google in firebase
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // get google auth
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // get credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // sign in with credential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      users = Usermodel.fromFirebase(userCredential.user!);
      // add user to fireStore database
      userStream = FirebaseAuth.instance.userChanges();
      await UserOperationsFirestore.addusertofirestore(
        users!,
      );
      saveUserId(users!);
      return right(Usermodel.fromFirebase(userCredential.user!));
    }
    // catch firebase auth exception
    on FirebaseAuthException catch (e) {
      return left(AuthException.firebaseAuthExceptionHandel(e));
    } catch (e) {
      return left(AuthException.unKnownExceptionHandel(e));
    }
  }

  // sign in with facebook
  @override
  Future<Either<Failure, Usermodel>> signinWithFacebook() async {
    try {
      // sign in with facebook
      final LoginResult loginResult = await FacebookAuth.instance.login();
      // get facebook credential
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // sign in with credential
      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      users = Usermodel.fromFirebase(userCredential.user!);
      // add user to fireStore database
      userStream = FirebaseAuth.instance.userChanges();
      UserOperationsFirestore.addusertofirestore(users!);
      saveUserId(users!);
      // return user from firebase
      return right(users!);
    }
    // catch firebase auth exception
    on FirebaseAuthException catch (e) {
      return left(AuthException.firebaseAuthExceptionHandel(e));
    } catch (e) {
      // return unknown exception and failure

      return left(AuthException.unKnownExceptionHandel(e));
    }
  }

  // sign in with apple for apple device only
  @override
  Future<Either<Failure, Usermodel>> signinWithApple() async {
    return left(Failure("سوف يتم تفعيله في وقت لاحق"));
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      return right(
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email));
    } on FirebaseAuthException catch (e) {
      return left(AuthException.firebaseAuthExceptionHandel(e));
    } catch (e) {
      return left(AuthException.unKnownExceptionHandel(e));
    }
  }

  @override
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // sign out
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return right(await FirebaseAuth.instance.signOut());
    } on FirebaseAuthException catch (e) {
      return left(AuthException.firebaseAuthExceptionHandel(e));
    } catch (e) {
      return left(AuthException.unKnownExceptionHandel(e));
    }
  }

  @override
  saveUserId(Usermodel user) {
    Preferences.setString("uid", user.uid!);
  }

  @override
  String? getUserId() {
    return Preferences.getStringfromShared("uid");
  }
}
