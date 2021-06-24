import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BasicForm extends StatelessWidget {
  static final routeName = "/basic_form";

  const BasicForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Form Builder Tutorial"),
      ),
      body: FormBody(),
    );
  }
}

class FormBody extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilder(
        key: _formKey,
        onChanged: () => print("form has changed"),
        autovalidateMode: AutovalidateMode.always,
        // initialValue: {"textfield": "Auto generate text"},
        skipDisabled: true,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              FormBuilderTextField(
                name: "name",
                decoration: InputDecoration(
                  hintText: "Enter your name",
                ),
                enabled: true,
                validator: FormBuilderValidators.equal(context, "Nihal"),
              ),
              SizedBox(height: 18),
              FormBuilderTextField(
                name: "last_name",
                decoration: InputDecoration(
                  hintText: "Enter your last name",
                ),
                enabled: true,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // final textFieldData =
                    //     _formKey.currentState.fields['textfield'].value;

                    // To user the current state value(Map), we need to first save.
                    _formKey.currentState.save();
                    final formData = _formKey.currentState.value;

                    FocusScope.of(context).unfocus();

                    ScaffoldMessenger.maybeOf(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          "$formData",
                          textScaleFactor: 1,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
