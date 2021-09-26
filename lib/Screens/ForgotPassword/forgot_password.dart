import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gate_aspirants/Screens/Login/components/Login.dart';
import 'package:gate_aspirants/Screens/Login/components/background.dart';
import 'package:gate_aspirants/components/rounded_button.dart';
import 'package:gate_aspirants/components/text_field_container.dart';
import '../../constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;

  void resetPassword(BuildContext context) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  successFull() {
    if (_formKey.currentState.validate()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Complete"),
          content: Text(
            "Reset password link has sent to $_email. Please use it to change the password.",
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => resetPassword(context),
              child: Text("okay"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        builder: (ctx) => AlertDialog(
          title: Text("Error !!"),
          content: Text("Please enter correct email"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
        context: null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.26,
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) => EmailValidator.validate(value)
                        ? null
                        : "Please enter a valid email",
                    controller: emailController,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter your email address",
                      border: InputBorder.none,
                    ),
                    onSaved: (value) => _email = value,
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: "Reset Password",
                  press: successFull,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    'Back to login page ?',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
