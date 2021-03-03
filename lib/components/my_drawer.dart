import 'package:flutter/material.dart';
import 'package:futureproof/components/site_map.dart';

class MyDrawer extends StatelessWidget {
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
