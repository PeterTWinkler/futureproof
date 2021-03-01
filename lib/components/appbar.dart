import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget{
  DefaultAppBar({this.title, this.actions});

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
