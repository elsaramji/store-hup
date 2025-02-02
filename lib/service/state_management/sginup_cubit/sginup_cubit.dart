// service/state_management/sginup_cubit/sginup_cubit.dart
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../core/models/user_entity.dart';
import '../../firebase/auth/auth_service.dart';

part 'sginup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.auth) : super(SignupInitial());
  final FirebaseAuthService auth;

  Future<void> signup(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoading());
    final result = await auth.createEmailWithemailandpassword(
        email: email, password: password, name: name);
        
    result.fold(
      (l) => emit(SignupError(l.errormassage())),
      (r) => emit(SignupSuccess(r)),
    );
  }
}
