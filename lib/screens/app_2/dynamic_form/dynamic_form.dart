import 'package:design_tutorial/constants.dart';
import 'package:design_tutorial/screens/app_2/dynamic_form/form_model.dart';
import 'package:design_tutorial/size_config.dart';
import 'package:flutter/material.dart';

class DynamicForm extends StatelessWidget {
  static final routeName = "/dynamic_form";

  const DynamicForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Form"),
      ),
      body: Body(), // MyForm(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static List<UserData> users = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    users.add(UserData());
  }

  onSavedPressed() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      for (var user in users) {
        print(user.name);
      }
    }
  }

  onRemovedPressed(id) {
    setState(() {
      users.removeAt(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) => FormComponent(
                        user: users[index],
                        removeForm: (id) => onRemovedPressed(id),
                        index: index)),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    users.add(UserData());
                  });
                },
                child: Text("+ Add More"),
              ),
              ElevatedButton(
                onPressed: () => onSavedPressed(),
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormComponent extends StatefulWidget {
  final UserData user;
  final Function removeForm;
  final int index;

  FormComponent({Key key, this.removeForm, this.user, this.index})
      : super(key: key);

  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  TextEditingController _nameController;
  FocusNode node;
  bool isError;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    node = FocusNode();

    addListener();
  }

  addListener() {
    node.addListener(() {
      // print(node.hasFocus);
      setState(() {
        isError = node.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _nameController.text = widget.user.name ?? "";
    // });

    print("${widget.index}: ${isError}");

    return Column(
      children: [
        widget.index == 0
            ? SizedBox()
            : SizedBox(
                height: 10,
              ),
        Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 1.5),
            child: SizedBox(
              // width: SizeConfig.screenWidth,
              // height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Form ",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),
                      ),
                      Spacer(),
                      widget.index == 0
                          ? SizedBox()
                          : ElevatedButton(
                              onPressed: () {
                                widget.removeForm(widget.index);
                              },
                              child: Text("X"),
                            ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextFormField(
                      focusNode: node,
                      controller: _nameController,
                      onChanged: (v) => _BodyState.users[widget.index].name = v,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter your name",
                      ),
                      validator: (v) {
                        // if (v.trim().isEmpty) return 'Please enter something';
                        // return null;

                        return isError == true
                            ? null
                            : v == ''
                                ? 'please enter text here...'
                                : null;
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
