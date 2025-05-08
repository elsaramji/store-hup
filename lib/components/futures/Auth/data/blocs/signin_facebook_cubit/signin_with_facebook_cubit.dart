import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_hup/components/futures/Auth/data/services/singin_firebase_services.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/error/signin_errors_entity.dart';

part 'signin_with_facebook_state.dart';

class SigninWithFacebookCubit extends Cubit<SigninWithFacebookState> {
  SigninWithFacebookCubit() : super(SigninWithFacebookInitial());
  void signinWithFacebook() async {
    emit(SigninWithFacebookLoading());
    final result = await SigninFirebaseServices().signinWithFacebook();
    result.fold(
      (l) => emit(SigninWithFacebookError(error: l)),
      (r) => emit(SigninWithFacebookSuccess(user: r)),
    );
  }
}
