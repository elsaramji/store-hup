import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repoimp/serviecs/firebase/singin_firebase_services.dart';
import '../../../domain/entities/signin_errors_entity.dart';
import '../../../domain/entities/user_entity.dart';
part 'signin_cubit_state.dart';

class SigninCubitCubit extends Cubit<SigninCubitState> {
  SigninCubitCubit() : super(SigninCubitLoading());

  signinWithemailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninCubitLoading());
    final result = await SigninFirebaseServicesImp().signinWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (l) => emit(SigninCubitError(error: l)),
      (r) => emit(SigninCubitSuccess(user: r)),
    );
  }
}
