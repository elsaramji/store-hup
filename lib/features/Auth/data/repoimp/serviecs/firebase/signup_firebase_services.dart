import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/entities/signup_errors_entity.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repos/sing_up_repo/signup_auth_entity.dart';
import '../../../models/signup_error_modle.dart';

class SignupFirebaseServices extends SignupAuthEntity {
  @override
  Future<Either<SignupErrorsEntity, UserEntity>> signupWithEmailAndPassword(
      UserEntity userEntity, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEntity.email, password: password);
      await credential.user!.updateDisplayName(userEntity.name);
      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      return left(SignupErrorModel.fromFirebaseAuthException(e));
    } catch (e) {
      return left(SignupErrorModel(
          errorMassage: "ربما لم تتكمل عملية التسجيل الرجاء اعادة المحاولة"));
    }
  }
}
