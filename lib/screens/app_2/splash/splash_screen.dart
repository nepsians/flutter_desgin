import 'package:design_tutorial/screens/app_2/splash/components/splash_body.dart';
import 'package:design_tutorial/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static final routeName = "/splash";

  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SplashBody(),
    );
  }
}
