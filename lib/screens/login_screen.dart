import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(child: Column(
          children: [
            Text('Welcome user!'),
            TextField(),
            TextField(),
          ],
        )),
      ),
    );
  }
}