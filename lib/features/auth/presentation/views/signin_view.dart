import 'package:driver_manager/core/helper_functions/custom_snak_bar.dart';
import 'package:driver_manager/core/services/get_it_service.dart';
import 'package:driver_manager/features/auth/domain/repo/auth_repo.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signin_cubit/signin_state.dart';
import 'package:driver_manager/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:driver_manager/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});
  static const routeName = '/login';

  @override
  State<SigninView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SigninView> {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              Navigator.pushNamed(context, HomeView.routeName);
            } else if (state is SignInFailure) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is SigninLoading ? true : false,
                child: const SigninViewBody());
          },
        ),
      ),
    );
  }
}
