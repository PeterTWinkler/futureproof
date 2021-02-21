import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            //TO BE REMOVED in production; added only to avoid 'debug' ribbon
            child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
          ),
        ],
      ),
    );
  }
}
