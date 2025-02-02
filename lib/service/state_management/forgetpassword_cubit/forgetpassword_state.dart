// service/state_management/forgetpassword_cubit/forgetpassword_state.dart
part of 'forgetpassword_cubit.dart';

@immutable
abstract class ForgetpasswordState {}

class ForgetpasswordInitial extends ForgetpasswordState {}

class ForgetpasswordLoading extends ForgetpasswordState {}

class ForgetpasswordError extends ForgetpasswordState {

  final String error;
  ForgetpasswordError(this.error);
}

class ForgetpasswordSuccess extends ForgetpasswordState {}


