part of 'signupwith_emailand_password_cubit.dart';

@immutable
sealed class SignupwithEmailandPasswordState {}

final class SignupwithEmailandPasswordInitial
    extends SignupwithEmailandPasswordState {}

final class SignupwithEmailandPasswordLoading
    extends SignupwithEmailandPasswordState {}

final class SignupwithEmailandPasswordSuccess
    extends SignupwithEmailandPasswordState {
  final UserEntity userEntity;

  SignupwithEmailandPasswordSuccess({required this.userEntity});
}

final class SignupwithEmailandPasswordError
    extends SignupwithEmailandPasswordState {
  final SignupErrorsEntity error;
  SignupwithEmailandPasswordError({required this.error});
}
