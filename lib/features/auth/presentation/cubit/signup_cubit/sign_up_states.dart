import 'package:driver_manager/features/auth/domain/entites/user_entity.dart';

abstract class SignUpStates {}

class SignUpInitatial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final UserEntity userEntity;

  SignUpSuccess({required this.userEntity});
}

class SignUpFailure extends SignUpStates {
  final String error;
  SignUpFailure({required this.error});
}
