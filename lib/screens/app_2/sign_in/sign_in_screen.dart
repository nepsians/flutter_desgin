import 'package:design_tutorial/constants.dart';
import 'package:design_tutorial/screens/app_2/sign_in/components/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static final String routeName = "/sign_in";

  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
        ),
      ),
      body: SignInBody(),
    );
  }
}
