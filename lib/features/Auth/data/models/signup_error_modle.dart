import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/signup_errors_entity.dart';

class SignupErrorModel extends SignupErrorsEntity {
  SignupErrorModel({required super.errorMassage});

  get errorMessage => errorMassage;
  factory SignupErrorModel.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return SignupErrorModel(errorMassage: 'كلمة المرور ضعيفة');
      case 'email-already-in-use':
        return SignupErrorModel(errorMassage: 'البريد الالكتروني مستخدم مسبقا');
      case 'invalid-email':
        return SignupErrorModel(errorMassage: 'البريد الالكتروني غير صالح');
      case 'network-request-failed':
        return SignupErrorModel(errorMassage: 'فشل الاتصال بالشبكة');
      case 'user-not-found':
        return SignupErrorModel(errorMassage: 'البريد الالكتروني غير موجود');
      case 'wrong-password':
        return SignupErrorModel(errorMassage: 'كلمة المرور غير صحيحة');
      case 'invalid-credential':
        return SignupErrorModel(
            errorMassage: 'ربما هناك خطا فى البريد الالكتروني او كلمة المرور');
      default:
        return SignupErrorModel(
            errorMassage: 'ربما هناك مشكلة الرجاء المحاولة لاحقا');
    }
  }
}