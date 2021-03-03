import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  MyAppBar({this.title, this.actions});

  final Text title;
  final List<Widget> actions;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? Text('Futureproof'),
      actions: actions ?? <Widget>[],
    );
  }
}
