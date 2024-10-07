import 'package:driver_manager/features/auth/presentation/views/forget_password.dart';
import 'package:driver_manager/features/auth/presentation/views/signin_view.dart';
import 'package:driver_manager/features/auth/presentation/views/signup_view.dart';
import 'package:driver_manager/features/clients/presentation/views/add_client_view.dart';
import 'package:driver_manager/features/home/presentation/views/home_view.dart';
import 'package:driver_manager/features/travels/presentation/views/add_driver_view.dart';
import 'package:flutter/material.dart';

/// Generates routes based on the provided settings.
///
/// @param settings The settings for the route.
/// @return A route based on the provided settings.

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case ForgetPassword.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetPassword());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AddDriverView.routeName:
      return MaterialPageRoute(builder: (context) => const AddDriverView());
    case AddClientView.routeName:
      return MaterialPageRoute(builder: (context) => const AddClientView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
