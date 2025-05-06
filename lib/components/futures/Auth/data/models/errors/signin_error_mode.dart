import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/error/signin_errors_entity.dart';

class SigninErrorModel extends SigninErrorsEntity {
  SigninErrorModel({required super.errorMassage});

  get errorMessage => errorMassage;
  factory SigninErrorModel.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return SigninErrorModel(errorMassage: 'كلمة المرور ضعيفة');
      case 'email-already-in-use':
        return SigninErrorModel(errorMassage: 'البريد الالكتروني مستخدم مسبقا');
      case 'invalid-email':
        return SigninErrorModel(errorMassage: 'البريد الالكتروني غير صالح');
      case 'network-request-failed':
        return SigninErrorModel(errorMassage: 'فشل الاتصال بالشبكة');
      case 'user-not-found':
        return SigninErrorModel(errorMassage: 'البريد الالكتروني غير موجود');
      case 'wrong-password':
        return SigninErrorModel(errorMassage: 'كلمة المرور غير صحيحة');
      case 'invalid-credential':
        return SigninErrorModel(
            errorMassage: 'ربما هناك خطا فى البريد الالكتروني او كلمة المرور');
      default:
        return SigninErrorModel(errorMassage: 'خطأ غير متوقع');
    }
  }
}
