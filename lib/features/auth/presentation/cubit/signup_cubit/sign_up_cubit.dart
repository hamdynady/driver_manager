import 'package:driver_manager/features/auth/domain/repo/auth_repo.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signup_cubit/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authRepo) : super(SignUpInitatial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(SignUpLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignUpFailure(error: failure.message)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
