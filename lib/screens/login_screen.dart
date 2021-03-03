import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/login';
  static const displayName = 'Login';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(size.width*0.2),
          child: Center(
            child: Column(
              children: [
                Text('Welcome user!'),
                TextField(),
                TextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
