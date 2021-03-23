import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';

class FormCompletedScreen extends StatefulWidget {
  static const id = '/form_completed';
  static const displayName = 'Form Completed';

  @override
  _FormCompletedScreenState createState() => _FormCompletedScreenState();
}

class _FormCompletedScreenState extends State<FormCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Icon(
                CupertinoIcons.checkmark_alt_circle_fill,
                size: 100.0,
                color: Colors.green,
              ),
              Text('Form completed. \n Thank you!')
            ],
          ),
        ),
      ),
    );
  }
}
