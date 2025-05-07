import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_hup/components/futures/Auth/data/services/singin_firebase_services.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/error/signin_errors_entity.dart';

part 'google_signin_state.dart';

class GoogleSigninCubit extends Cubit<GoogleSigninState> {
  GoogleSigninCubit() : super(GoogleSignin());

  void signinWithGoogle() async {
    emit(GoogleSigninLoading());
    final result = await SinginFirebaseServices().signinWithGoogle();
    result.fold(
      (l) => emit(GoogleSigninError(l)),
      (r) => emit(GoogleSigninSuccess(userEntity: r)),
    );
  }
}
