import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_hup/components/futures/Auth/data/services/singin_firebase_services.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_in_domain/error/signin_errors_entity.dart';

part 'signin_cubit_state.dart';

class SigninCubitCubit extends Cubit<SigninCubitState> {
  SigninCubitCubit() : super(SigninCubitLoading());

  signinWithemailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninCubitLoading());
    final result = await SigninFirebaseServices().signinWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (l) => emit(SigninCubitError(error: l)),
      (r) => emit(SigninCubitSuccess(user: r)),
    );
  }
}
