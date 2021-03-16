import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';
import 'package:futureproof/screens/welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const id = '/register';
  static const displayName = 'Register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                Text('Register here'),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(hintText: "Password"),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
