import 'package:design_tutorial/screens/app_2/dynamic_form/dynamic_form.dart';
import 'package:design_tutorial/screens/app_2/forgot_password/forgot_password.dart';
import 'package:design_tutorial/screens/app_2/sign_in/sign_in_screen.dart';
import 'package:design_tutorial/screens/app_2/sign_in_success/sign_in_success.dart';
import 'package:design_tutorial/screens/app_2/splash/splash_screen.dart';
import 'package:design_tutorial/screens/app_3/basic_form.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  SignInSuccess.routeName: (context) => SignInSuccess(),
  DynamicForm.routeName: (context) => DynamicForm(),

  //app_3 FormBuilder
  BasicForm.routeName: (context) => BasicForm(),
};
