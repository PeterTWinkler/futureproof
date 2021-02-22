import 'package:flutter/material.dart';
import 'package:futureproof/components/appbar.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text('Menu'),
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
