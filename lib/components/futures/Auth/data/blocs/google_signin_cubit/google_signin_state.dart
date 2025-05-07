part of 'google_signin_cubit.dart';

@immutable
sealed class GoogleSigninState {}



final class GoogleSignin extends GoogleSigninState {}
final class GoogleSigninSuccess extends GoogleSigninState {
  final UserEntity userEntity;
 GoogleSigninSuccess({required this.userEntity});
}

final class GoogleSigninLoading extends GoogleSigninState {}
final class GoogleSigninError extends GoogleSigninState {
  final SigninErrorsEntity error;
  GoogleSigninError(this.error);
}
