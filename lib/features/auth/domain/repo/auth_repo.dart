import 'package:dartz/dartz.dart';
import 'package:driver_manager/core/errors/failure.dart';
import 'package:driver_manager/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> signinWithGoogle();
  Future addUserData({required UserEntity user});
}
