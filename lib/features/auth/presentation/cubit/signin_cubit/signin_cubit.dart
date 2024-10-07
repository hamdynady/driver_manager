import 'package:driver_manager/features/auth/domain/repo/auth_repo.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signin_cubit/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signinWithEmailAndPassowrd(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signinWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity)),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signinWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity)),
    );
  }
}
