// service/state_management/sginin_cubit/siginin_cubit_cubit.dart
import 'package:bloc/bloc.dart';
import '../../../core/injection/Git_it.dart';

import '../../../core/models/user_entity.dart';
import '../../../core/injection/firebase/auth/auth_service.dart';

part 'siginin_cubit_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());
  FirebaseAuthService auth = getIt<FirebaseAuthService>();
  Future<void> signInWithemailandpassword(
      {required String email, required String password}) async {
    emit(SigninLoading());
    final result =
        await auth.signInWithEmailandpassword(email: email, password: password);
    result.fold((l) {
      emit(SigninError(l.message));
    }, (r) {
      emit(SigninSuccess(r));
    });
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final result = await auth.signinWithGoogle();
    result.fold((l) {
      emit(SigninError(l.message));
    }, (r) {
      emit(SigninSuccess(r));
    });
  }

  Future<void> signinWithFacebook() async {
    final result = await auth.signinWithFacebook();
    result.fold((l) {
      emit(SigninError(l.message));
    }, (r) {
      emit(SigninSuccess(r));
    });
  }

  Future<void> signinWithApple() async {
    final result = await auth.signinWithApple();
    result.fold((l) {
      emit(SigninError(l.message));
    }, (r) {
      emit(SigninSuccess(r));
    });
  }
}
