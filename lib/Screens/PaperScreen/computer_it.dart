import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gate_aspirants/Papers/computet_it/2019.dart';
import 'package:gate_aspirants/Screens/Favorites/favorites.dart';
import 'package:gate_aspirants/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main_drawer.dart';

class ComputerIt extends StatefulWidget {
  static const routeName = 'User';

  @override
  _ComputerItState createState() => _ComputerItState();
}

class _ComputerItState extends State<ComputerIt> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLogin = false;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isLogin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Gate Aspirants",
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: !isLogin
              ? Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : Column(
                  children: [
                    Card(
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 60.0,
                            child: Text(
                              '2019',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          title: Text(
                            "Gate-Computer Sci",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CeIt2019(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 60.0,
                            child: Text(
                              'CE',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          title: Text(
                            "Gate-Computer Sci",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComputerIt(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 60.0,
                            child: Text(
                              'CE',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          title: Text(
                            "Gate-Computer Sci",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComputerIt(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 60.0,
                            child: Text(
                              'CE',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          title: Text(
                            "Gate-Computer Sci",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComputerIt(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 60.0,
                            child: Text(
                              'CE',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          title: Text(
                            "Gate-Computer Sci",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComputerIt(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: kPrimaryColor,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComputerIt(),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.star_border,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favorites(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {},
        child: new Icon(
          Icons.person,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
