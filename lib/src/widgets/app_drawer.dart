import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildHeader(context),
          buildListTile('Meals', Icons.restaurant, onTap: () {}),
          buildListTile('Filters', Icons.settings, onTap: () {}),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        'Cooking Up!',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, {Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
