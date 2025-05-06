part of 'signin_cubit_cubit.dart';

@immutable
sealed class SigninCubitState {}

class SigninCubitSuccess extends SigninCubitState {
  final UserEntity user;
  SigninCubitSuccess({required this.user});
}

class SigninCubitLoading extends SigninCubitState {}

class SigninCubitError extends SigninCubitState {
  final SigninErrorsEntity error;
  SigninCubitError({required this.error});
}
