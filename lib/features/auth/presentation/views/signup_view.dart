import 'package:driver_manager/core/helper_functions/custom_snak_bar.dart';
import 'package:driver_manager/core/services/get_it_service.dart';
import 'package:driver_manager/features/auth/domain/repo/auth_repo.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signup_cubit/sign_up_cubit.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signup_cubit/sign_up_states.dart';
import 'package:driver_manager/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:driver_manager/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const routeName = 'signup';

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocConsumer<SignUpCubit, SignUpStates>(
            listener: (context, state) {
              if (state is SignUpLoading) {
                showSnackBar(context, '.....تحميل');
              } else if (state is SignUpSuccess) {
                Navigator.pushNamed(context, HomeView.routeName);
              } else if (state is SignUpFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignUpLoading,
                child: const SignUpViewBody(),
              );
            },
          ),
        ),
      ),
    );
  }
}
