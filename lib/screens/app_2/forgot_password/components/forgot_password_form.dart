import 'package:design_tutorial/components/custom_svg_icon.dart';
import 'package:design_tutorial/components/default_button.dart';
import 'package:design_tutorial/components/form_error.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  ForgotPasswordForm({Key key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _globalKey = GlobalKey<FormState>();
  final List<String> errorList = [];
  String email;

  _onContinuePressed() {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) => email = value,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/Mail.svg",
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && errorList.contains(kEmailNullError)) {
                setState(() {
                  errorList.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errorList.contains(kInvalidEmailError)) {
                setState(() {
                  errorList.remove(kInvalidEmailError);
                });
              }

              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errorList.contains(kEmailNullError)) {
                setState(() {
                  errorList.add(kEmailNullError);
                });

                return "";
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errorList.contains(kInvalidEmailError)) {
                setState(() {
                  errorList.add(kInvalidEmailError);
                });

                return "";
              }

              return null;
            },
          ),
          FormError(errors: errorList),
          SizedBox(height: getProportionateScreenHeight(34)),
          DefaultButton(
            title: "Continue",
            onPress: _onContinuePressed,
          ),
          // Text("Value: ${email != null ? email : "No Email found"}")
        ],
      ),
    );
  }
}
