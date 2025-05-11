import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repoimp/serviecs/firebase/singin_firebase_services.dart';
import '../../../domain/entities/signin_errors_entity.dart';
import '../../../domain/entities/user_entity.dart';

part 'signin_with_facebook_state.dart';

class SigninWithFacebookCubit extends Cubit<SigninWithFacebookState> {
  SigninWithFacebookCubit() : super(SigninWithFacebookInitial());
  void signinWithFacebook() async {
    emit(SigninWithFacebookLoading());
    final result = await SigninFirebaseServicesImp().signinWithFacebook();
    result.fold(
      (l) => emit(SigninWithFacebookError(error: l)),
      (r) => emit(SigninWithFacebookSuccess(user: r)),
    );
  }
}
