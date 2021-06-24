import 'package:design_tutorial/screens/app_2/forgot_password/components/forgot_password_body.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static final routeName = "/forgot_password";

  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: ForgotPasswordBody(),
    );
  }
}
