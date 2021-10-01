import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gate_aspirants/Screens/Login/components/Login.dart';
import 'package:gate_aspirants/Screens/Login/components/background.dart';
import 'package:gate_aspirants/components/rounded_button.dart';
import 'package:gate_aspirants/components/text_field_container.dart';
import '../../constants.dart';
import '../../main_drawer.dart';

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
    Fluttertoast.showToast(
      msg: "Password reset link send to your email account",
      backgroundColor: kPrimaryLightColor,
      // fontSize: 25
      // gravity: ToastGravity.TOP,
      textColor: Colors.black,
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Forgot Password'),
      ),
      drawer: MainDrawer(),
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
                  press: ()=>resetPassword(context),
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
