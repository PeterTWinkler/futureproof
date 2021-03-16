import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = '/welcome';
  static const displayName = 'Welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User loggedInUser;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(authData: _auth),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green.shade900, Colors.red],
              stops: [1, 0.2],
            ),
          ),
          child: Text('Welcome ${loggedInUser.email}!'),
        ),
      ),
    );
  }
}
