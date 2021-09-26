import 'package:fluttertoast/fluttertoast.dart';
import 'package:gate_aspirants/Screens/Login/components/background.dart';
import 'package:gate_aspirants/Screens/Login/login_screen.dart';
import 'package:gate_aspirants/components/already_have_an_account_acheck.dart';
import 'package:gate_aspirants/components/rounded_button.dart';
import 'package:gate_aspirants/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_auth/email_auth.dart';
import '../../../constants.dart';
import '../../../main_drawer.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String _name, _email, _password, _otp;

  void sendOTP() async {
    EmailAuth.sessionName = "Gate Aspirants";
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      Fluttertoast.showToast(
        msg: "OTP Send to your email account please verify",
        backgroundColor: kPrimaryLightColor,
        // fontSize: 25
        // gravity: ToastGravity.TOP,
        textColor: Colors.black,
      );

      print('OTP Send');
    } else {
      Fluttertoast.showToast(
        msg: "Error while sending OTP. Please try again latter",
        backgroundColor: kPrimaryLightColor,
        // fontSize: 25
        // gravity: ToastGravity.TOP,
        textColor: Colors.black,
      );

      print('We could not send the OTP');
    }
  }

  void verifyOTP() {
    var res = EmailAuth.validate(
      receiverMail: _emailController.text,
      userOTP: _otpController.text,
    );
    if (res) {
      Fluttertoast.showToast(
        msg: "OTP Verify successfully",
        backgroundColor: kPrimaryLightColor,
        // fontSize: 25
        // gravity: ToastGravity.TOP,
        textColor: Colors.black,
      );
      setState(() {
        changeButton = true;
        print('Done');
      });
    } else {
      Fluttertoast.showToast(
        msg: "Invalid OTP !!",
        backgroundColor: kPrimaryLightColor,
        // fontSize: 25
        // gravity: ToastGravity.TOP,
        textColor: Colors.black,
      );
      setState(() {
        changeButton = false;
        print('Fail');
      });
    }
  }

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
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate() && changeButton == true) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  successFull() {
    if (_formKey.currentState.validate() && changeButton == true) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Complete"),
          content: Text("Registration Successfully Completed"),
          actions: <Widget>[
            FlatButton(
              onPressed: signUp,
              child: Text("okay"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Error !!"),
          content: Text("Registration Failed"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
    }
  }

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool textVisibility = true;
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Sign Up'),
      ),
      drawer: MainDrawer(),
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.20,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter Valid Username';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        hintText: "Enter your name",
                        border: InputBorder.none,
                      ),
                      onSaved: (input) => _name = input,
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Please enter a valid email';
                        return null;
                      },
                      controller: _emailController,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        ),
                        hintText: "Enter email address",
                        border: InputBorder.none,
                        suffixIcon: TextButton(
                          child: Text(
                            'Send OTP',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            currentFocus.unfocus();
                            changeButton = false;
                            sendOTP();
                          },
                        ),
                      ),
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColor,
                      controller: _otpController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: TextButton(
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: kPrimaryColor,
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Verify',
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                            onPressed: () {
                              setState(() {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                currentFocus.unfocus();

                                return verifyOTP();
                              });
                            }),
                        hintText: "Enter OTP",
                        border: InputBorder.none,
                      ),
                      onSaved: (input) => _otp = input,
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      validator: (input) {
                        if (input.length < 6)
                          return 'Provide Minimum 6 Character';
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        hintText: "Enter password",
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            currentFocus.unfocus();
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
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {
                      successFull();
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
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
      ),
    );
  }
}
