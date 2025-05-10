import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../data/repoimp/serviecs/firebase/singin_firebase_services.dart';
import '../../../domain/entities/signin_errors_entity.dart';
import '../../../domain/entities/user_entity.dart';

part 'google_signin_state.dart';

class GoogleSigninCubit extends Cubit<GoogleSigninState> {
  GoogleSigninCubit() : super(GoogleSignin());

  void signinWithGoogle() async {
    emit(GoogleSigninLoading());
    final result = await SigninFirebaseServices().signinWithGoogle();
    result.fold(
      (l) => emit(GoogleSigninError(l)),
      (r) => emit(GoogleSigninSuccess(userEntity: r)),
    );
  }
}
