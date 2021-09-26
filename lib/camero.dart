import 'package:flutter/material.dart';
import 'package:gate_aspirants/Admin/home.dart';
import 'package:gate_aspirants/Screens/Welcome/welcome_screen.dart';
import 'package:gate_aspirants/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        HomePageAdmin.routeName: (ctx) => HomePageAdmin(),
      },
    );
  }
}