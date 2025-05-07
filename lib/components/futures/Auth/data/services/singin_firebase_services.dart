import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_hup/components/futures/Auth/data/models/errors/signin_error_mode.dart';
import 'package:store_hup/components/futures/Auth/data/models/user_model.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/entities/signin_auth_repo_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/error/signin_errors_entity.dart';

class SinginFirebaseServices extends SigninAuthRepoEntity {
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
      return left(SigninErrorModel(errorMassage: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<SigninErrorsEntity, UserEntity>> signinWithFacebook() {
    // TODO: implement signinWithFacebook
    throw UnimplementedError();
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
      return right(UserModel.fromFirebase(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      return left(SigninErrorModel.fromFirebaseAuthException(e));
    } catch (e) {
      return left(SigninErrorModel(errorMassage: 'خطأ غير متوقع'));
    }
  }
}
