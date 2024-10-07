import 'package:driver_manager/features/auth/domain/entites/user_entity.dart';

abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess(this.userEntity);
}

class SignInFailure extends SigninState {
  final String error;

  SignInFailure(this.error);
}
