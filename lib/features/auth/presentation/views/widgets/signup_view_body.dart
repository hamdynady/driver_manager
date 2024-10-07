import 'package:driver_manager/core/helper_functions/custom_style.dart';
import 'package:driver_manager/core/widgets/custom_button.dart';
import 'package:driver_manager/core/widgets/custom_textfield.dart';
import 'package:driver_manager/features/auth/presentation/cubit/signup_cubit/sign_up_cubit.dart';
import 'package:driver_manager/features/auth/presentation/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool obSecureText = true;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;

  bool? checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double formWidth = screenWidth > 600
            ? 400
            : screenWidth * .9; // Set form width for web
        return SingleChildScrollView(
          child: Form(
            key: fromKey,
            autovalidateMode: autovalidateMode,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: formWidth * .001,
                ),
              ),
              width: formWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black45,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SigninView.routeName);
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    ' انشاء حساب جديد',
                    style: customStyle(textColor: Colors.black, fontSize: 19),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hint: 'الاسم كامل',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الاسم كامل';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  const SizedBox(height: 16),
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
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hint: ' كلمة المرور',
                    textDirection: TextDirection.rtl,
                    obSecuredText: obSecureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obSecureText = !obSecureText;
                        });
                      },
                      icon: Icon(
                        obSecureText == true
                            ? FontAwesomeIcons.eye
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
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    onTab: () {
                      if (fromKey.currentState!.validate()) {
                        fromKey.currentState!.save();
                        context
                            .read<SignUpCubit>()
                            .createUserWithEmailAndPassword(email, password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    style: customStyle(
                      textColor: Colors.white,
                      fontSize: 16,
                      weight: FontWeight.w700,
                    ),
                    buttonName: 'انشاء حساب جديد',
                    color: Colors.green.shade700,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تمتلك حساب بالفعل؟',
                        style: customStyle(
                          textColor: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SigninView.routeName);
                        },
                        icon: Text(
                          'تسجيل الدخول',
                          style: customStyle(
                              textColor: const Color(0xff1B5E37),
                              weight: FontWeight.w500),
                        ),
                      ),
                    ],
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
