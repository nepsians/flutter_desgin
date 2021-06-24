import 'package:design_tutorial/components/default_button.dart';
import 'package:design_tutorial/size_config.dart';
import 'package:flutter/material.dart';

class SignInSuccess extends StatelessWidget {
  static final routeName = "/sign_in_success";

  const SignInSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight - 84,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              Image.asset(
                "assets/images/success.png",
                height: SizeConfig.screenHeight * 0.4,
              ),
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              Text(
                "Login Success",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              DefaultButton(
                title: "Back to home",
                onPress: () {},
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
