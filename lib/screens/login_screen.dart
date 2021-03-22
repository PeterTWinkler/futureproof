import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';
import 'package:futureproof/screens/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';
  static const displayName = 'Login';
  //static const bool loginAccessible = false; //only logged-in users can visit

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(authData: _auth),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.2),
          child: Center(
            child: Column(
              children: [
                Text('Welcome user!'),
                TextField(
                  decoration: InputDecoration(hintText: "Email"),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (user != null) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
