// import 'package:commerce_app/screens/login.dart';
import 'package:commerce_app/widgets/myTextFormField.dart';
import 'package:commerce_app/widgets/mybutton.dart';
import 'package:flutter/material.dart';

import '../widgets/changescreen.dart';
import '../widgets/passwordTextFromField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void vaildation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "User Name",
            validator: (value) {
              if (value!.length < 6) {
                return "Please fill UserName";
              } else if (value == "") {
                return "UserName is too short";
              }
              return "";
            },
          ),
          TextFormField(
            validator: (value) {
              if (value == "") {
                return "Please fill Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Email is invaild";
              }
              return "";
            },
            decoration: const InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            validator: (value) {
              if (value == "") {
                return "Please fill Password";
              } else if (value!.length < 8) {
                return "Password is too short";
              }
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyTextFormField(
            name: "Phone Number",
            validator: (value) {
              if (value == "") {
                return "Please fill Phone number";
              } else if (value!.length < 11) {
                return "Phone number must be 11";
              }
              return "";
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              vaildation();
            },
          ),
          ChangeScreen(
            name: "Login",
            whichAccount: "I have not Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => SignUp()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 330,
                width: double.infinity,
                // color: Colors.blue,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildBottomPart(),
            ],
          ),
        ),
      )),
    );
  }
}
