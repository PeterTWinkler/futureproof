import 'package:flutter/material.dart';
import 'package:futureproof/components/appbar.dart';
import 'package:futureproof/components/site_map.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;
  List<ListTile> getMenuListTiles(BuildContext context) {
    List<ListTile> menuListTiles = [];
    routeNames.forEach((routeName) {
      menuListTiles.add(
        ListTile(
          title: Text(routeName),
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
        ),
      );
    });
    return menuListTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      drawer: Drawer(
        child: ListView(
          children: getMenuListTiles(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade900, Colors.deepOrange, Colors.red],
            stops: [0.3, 0.9, 1],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                'counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
