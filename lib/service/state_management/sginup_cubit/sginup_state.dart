// service/state_management/sginup_cubit/sginup_state.dart
part of 'sginup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final Usermodel user;
  SignupSuccess(this.user);
}

class SignupError extends SignupState {
  final String message;
  SignupError(this.message);
}
