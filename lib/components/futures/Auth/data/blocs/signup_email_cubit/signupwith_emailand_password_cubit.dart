import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:store_hup/components/futures/Auth/data/services/signup_firebase_services.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';
import 'package:store_hup/components/futures/Auth/domain/sing_up_domain/errors/signup_errors_entity.dart';

part 'signupwith_emailand_password_state.dart';

class SignupwithEmailandPasswordCubit
    extends Cubit<SignupwithEmailandPasswordState> {
  SignupwithEmailandPasswordCubit()
      : super(SignupwithEmailandPasswordInitial());
  void signupWithEmailAndPassword({
    required UserEntity userEntity,
    required String password,
  }) async{
    emit(SignupwithEmailandPasswordLoading());
    final result = await SignupFirebaseServices()
        .signupWithEmailAndPassword(userEntity, password);
    result.fold(
      (l) => emit(SignupwithEmailandPasswordError(error: l)),
      (r) => emit(SignupwithEmailandPasswordSuccess(userEntity: r)),
    );
  }
}
