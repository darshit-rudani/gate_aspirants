import 'package:gate_aspirants/Admin/home.dart';
import 'package:gate_aspirants/Screens/ForgotPassword/forgot_password.dart';
import 'package:gate_aspirants/Screens/Login/components/background.dart';
import 'package:gate_aspirants/Screens/Signup/components/or_divider.dart';
import 'package:gate_aspirants/Screens/Signup/components/social_icon.dart';
import 'package:gate_aspirants/components/already_have_an_account_acheck.dart';
import 'package:gate_aspirants/components/rounded_button.dart';
import 'package:gate_aspirants/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../main_drawer.dart';
import '../../Signup/components/SignUp.dart';
import '../../../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pass = TextEditingController();

  String _email, _password;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  login() async {
    print(_email);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errorMessage),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  checkAdminOrUser() {
    if (_email == 'admin@gmail.com' && _password == 'admin111') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageAdmin(),
        ),
      );
    } else {
      login();
      print(_email);
    }
  }

  bool textVisibility = true;

  navigateToSignUp() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Login'),
      ),
      drawer: MainDrawer(),
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.26,
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) return 'Enter Email';
                      return null;
                    },
                    cursorColor: kPrimaryColor,
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter your email address",
                      border: InputBorder.none,
                    ),
                    onSaved: (input) => _email = input,
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (textVisibility == true) {
                              textVisibility = false;
                            } else if (textVisibility == false) {
                              textVisibility = true;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.visibility,
                        ),
                        color: kPrimaryColor,
                      ),
                    ),
                    cursorColor: kPrimaryColor,
                    obscureText: textVisibility,
                    onSaved: (input) => _password = input,
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    setState(() {
                      return checkAdminOrUser();
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                AlreadyHaveAnAccountCheck(
                  press: navigateToSignUp,
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: googleSignIn,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
