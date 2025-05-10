part of 'signin_with_facebook_cubit.dart';

@immutable
sealed class SigninWithFacebookState {}

class SigninWithFacebookInitial extends SigninWithFacebookState {}

class SigninWithFacebookLoading extends SigninWithFacebookState {}
class SigninWithFacebookSuccess extends SigninWithFacebookState {
  final UserEntity user;
  SigninWithFacebookSuccess({required this.user});
}
class SigninWithFacebookError extends SigninWithFacebookState {
  final SigninErrorsEntity error;
  SigninWithFacebookError({required this.error});
}
