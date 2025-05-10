import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repoimp/serviecs/firebase/signup_firebase_services.dart';
import '../../../domain/entities/signup_errors_entity.dart';
import '../../../domain/entities/user_entity.dart';


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
