import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    Key key, Title title, BuildContext context
  }) : super(key: key, title: title, actions: <Widget>[
    Padding(
      padding: const EdgeInsets.only(right: 50.0),
      //TO BE REMOVED in production; added only to avoid 'debug' ribbon
      child: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
          }
      ),
    ),
  ]);
}