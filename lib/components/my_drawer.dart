import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/site_map.dart';
import 'package:futureproof/screens/home_screen.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({this.authData});
  final FirebaseAuth authData;

  List<ListTile> getMenuListTiles(BuildContext context) {
    List<ListTile> menuListTiles = [];
    routeNames.forEach((routeName) {
      menuListTiles.add(
        ListTile(
          title: Text(displayNamesMap[routeName]),
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
        ),
      );
    });
    menuListTiles.add(
        ListTile(
          title: Text('Log out'),
          onTap: () {
            authData.signOut();
            Navigator.pushNamed(context, HomeScreen.id);
          },
        )
    );
    return menuListTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: getMenuListTiles(context),
      ),
    );
  }
}
