import 'dart:async';
import 'package:gate_aspirants/Screens/Favorites/favorites.dart';
import 'package:gate_aspirants/Screens/Login/components/Login.dart';
import 'package:gate_aspirants/Screens/Signup/components/SignUp.dart';
import 'package:gate_aspirants/Screens/Welcome/components/Start.dart';
import 'package:flutter/material.dart';
import 'package:gate_aspirants/user/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Admin/home.dart';
import 'Screens/Login/components/Login.dart';
import 'Screens/Signup/components/SignUp.dart';
import 'Screens/Welcome/components/Start.dart';
import 'Shorting/filters_screen.dart';
import 'components/rounded_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/1.jpg'),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Map<String, bool> _filters = {
    'Computer': false,
    'IT': false,
    'Chemical': false,
    'Civil': false,
    'Electrical': false,
    'Electronics': false,
    'Instrumentation': false,
    'Mechanical': false,
  };
  List _favoritesMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => HomePageUser(),
        "Login": (BuildContext context) => Login(),
        "SignUp": (BuildContext context) => SignUp(),
        "start": (BuildContext context) => Start(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
        HomePageAdmin.routeName: (ctx) => HomePageAdmin(),
        HomePageUser.routeName: (ctx) => HomePageUser(),
        RoundedButton.routeName: (ctx) => RoundedButton(),
        Favorites.routeName: (ctx) => Favorites(),
      },
    );
  }
}
