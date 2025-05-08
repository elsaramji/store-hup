import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_hup/components/futures/Auth/data/models/errors/signup_error_modle.dart';
import 'package:store_hup/components/futures/Auth/data/services/singin_firebase_services.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_up_domain/entities/signup_auth_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_up_domain/errors/signup_errors_entity.dart';

class SignupFirebaseServices extends SignupAuthEntity {
  @override
  Future<Either<SignupErrorsEntity, UserEntity>> signupWithEmailAndPassword(
      UserEntity userEntity, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEntity.email, password: password);
      await credential.user!.updateDisplayName(userEntity.name);
      SigninFirebaseServices().signinWithEmailAndPassword(
          email: userEntity.email, password: password);
      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      return left(SignupErrorModel.fromFirebaseAuthException(e));
    } catch (e) {
      return left(SignupErrorModel(
          errorMassage: "ربما لم تتكمل عملية التسجيل الرجاء اعادة المحاولة"));
    }
  }
}
