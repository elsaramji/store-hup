// service/state_management/forgetpassword_cubit/forgetpassword_cubit.dart
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../core/constant/end_points.dart';
import '../../firebase/auth/auth_service.dart';
import '../../firebase/data/firestore_service.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  final FirebaseAuthService auth;
  ForgetpasswordCubit(this.auth) : super(ForgetpasswordInitial());

  void forgetPassword(String email) async {
    emit(ForgetpasswordLoading());
    final bool email_status = await FirestoreService()
        .isnotExist(path: EndPoints.usersEndPoints, email: email);
    try {
      if (!email_status) {
        await auth.forgetPassword(email: email);
        emit(ForgetpasswordSuccess());
      } else {
        emit(ForgetpasswordError("هذا المستخدم غير موجود"));
      }
    } catch (e) {
      emit(ForgetpasswordError("$e"));
    }
  }
}
