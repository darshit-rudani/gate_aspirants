import 'package:flutter/material.dart';
import 'package:gate_aspirants/constants.dart';

final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 1,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ),
);

final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
  leading: CircleAvatar(
    backgroundColor: kPrimaryColor,
    radius: 60.0,
    child: Text(
      'CE',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  title: Text(
    "Gate-Computer Sci",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  trailing: Icon(
    Icons.keyboard_arrow_right,
    color: Colors.black,
    size: 30.0,
  ),
);

final makeBody1 = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 1,
    itemBuilder: (BuildContext context, int index) {
      return makeCard1;
    },
  ),
);

final makeCard1 = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: makeListTile1,
  ),
);

final makeListTile1 = ListTile(
  leading: CircleAvatar(
    backgroundColor: kPrimaryColor,
    radius: 60.0,
    child: Text(
      'IT',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  title: Text(
    "Gate-IT Engineering",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  trailing: Icon(
    Icons.keyboard_arrow_right,
    color: Colors.black,
    size: 30.0,
  ),
);

final makeBody2 = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 1,
    itemBuilder: (BuildContext context, int index) {
      return makeCard2;
    },
  ),
);

final makeCard2 = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: makeListTile2,
  ),
);

final makeListTile2 = ListTile(
  leading: CircleAvatar(
    backgroundColor: kPrimaryColor,
    radius: 60.0,
    child: Text(
      'ECE',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  title: Text(
    "Gate-Electronics",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  trailing: Icon(
    Icons.keyboard_arrow_right,
    color: Colors.black,
    size: 30.0,
  ),
);
