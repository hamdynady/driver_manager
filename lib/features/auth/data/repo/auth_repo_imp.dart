import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:driver_manager/core/errors/custom_exception.dart';
import 'package:driver_manager/core/errors/failure.dart';
import 'package:driver_manager/core/services/backend_endpoint.dart';
import 'package:driver_manager/core/services/database_service.dart';
import 'package:driver_manager/core/services/firebase_auth_service.dart';
import 'package:driver_manager/features/auth/data/models/user_model.dart';
import 'package:driver_manager/features/auth/domain/entites/user_entity.dart';
import 'package:driver_manager/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      log("Eception at auth_repo.createUserWithEmailAndPassword ${e.toString()} ");
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Eception at auth_repo.createUserWithEmailAndPassword ${e.toString()} ");
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Eception at auth_repo.signinWithEmailAndPassword ${e.toString()} ");
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Eception at auth_repo.signinWithEmailAndPassword ${e.toString()} ");
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Eception at auth_repo.signinWithGoogle ${e.toString()} ");
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Eception at auth_repo.signinWithGoogle ${e.toString()} ");
      return left(
          ServerFailure(message: "حدث  خطأ في عملية تسجيل الدخول بالجوجل"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }
}
