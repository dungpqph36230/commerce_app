import 'package:commerce_app/screens/signup.dart';
import 'package:commerce_app/widgets/changescreen.dart';
import 'package:commerce_app/widgets/myTextFormField.dart';
import 'package:commerce_app/widgets/passwordTextFromField.dart';
import 'package:flutter/material.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginState extends State<Login> {
  void vaildation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  Widget _buildAllPart() {
    return Container(
      height: 260,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value == "") {
                return "Please fill Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Email Is Invaild";
              }
              return "";
            },
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
          // TextFormField
          MyButton(
            name: "Login",
            onPressed: () {
              vaildation();
            },
          ),
          ChangeScreen(
            name: "SignUp",
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
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_buildAllPart()],
          ),
        ),
      ),
    );
  }
}
