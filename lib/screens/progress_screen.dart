import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';

class ProgressScreen extends StatelessWidget {
  static const id = '/progress';
  static const displayName = 'Progress';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}

