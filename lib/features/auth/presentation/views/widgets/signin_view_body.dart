import 'package:driver_manager/core/helper_functions/custom_style.dart';
import 'package:driver_manager/core/widgets/custom_button.dart';
import 'package:driver_manager/core/widgets/custom_textfield.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:driver_manager/features/auth/presentation/views/signup_view.dart';
import 'package:driver_manager/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  bool obSecureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
          // Get screen width to check if it is a web screen
          builder: (context, constrains) {
        double screenWidth = constrains.maxWidth;
        double formWidth = screenWidth > 600
            ? 400
            : screenWidth * .9; // Set form width for web
        return SingleChildScrollView(
          child: SizedBox(
            width: formWidth,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      'تسجيل دخول',
                      style: customStyle(
                        textColor: AppColor.primaryColor,
                        fontSize: 19,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hint: 'البريد الإلكتروني',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email address';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hint: ' كلمة المرور',
                    onSaved: (value) {
                      password = value!;
                    },
                    obSecuredText: obSecureText,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obSecureText = !obSecureText;
                        });
                      },
                      icon: Icon(
                        obSecureText == true
                            ? FontAwesomeIcons.solidEye
                            : FontAwesomeIcons.solidEyeSlash,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      } else if (!RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&]).{8,}$')
                          .hasMatch(value)) {
                        return 'Please enter a strong password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  IconButton(
                    onPressed: () {},
                    icon: Text(
                      'نسيت كلمة المرور ؟',
                      style: customStyle(
                        fontSize: 13,
                        textColor: const Color(0xff2D9F5D),
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 31),
                  CustomButton(
                    onTab: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SigninCubit>()
                            .signinWithEmailAndPassowrd(email, password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    style: customStyle(
                      textColor: Colors.white,
                      fontSize: 16,
                      weight: FontWeight.w700,
                    ),
                    buttonName: 'تسجيل دخول',
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpView.routeName);
                        },
                        icon: Text(
                          'قم بإنشاء حساب',
                          style: customStyle(
                            textColor: const Color(0xff1E5B37),
                          ),
                        ),
                      ),
                      Text(
                        'لا تملك حسابا؟',
                        style: customStyle(
                          textColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 37),
                  CustomButton(
                    onTab: () {
                      context.read<SigninCubit>().signinWithGoogle();
                    },
                    buttonName: 'تسجيل بواسطة جوجل',
                    color: Colors.white,
                    textColor: Colors.black,
                    image: 'assets/images/googleIcon.png',
                    style: customStyle(
                      textColor: Colors.black,
                      fontSize: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
