import 'package:flutter/material.dart';
import 'package:recipes/src/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  final String routeIdentifier;

  AppDrawer(this.routeIdentifier);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildHeader(context),
          buildListTile(context, 'Meals', Icons.restaurant, '/', onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile(context, 'Filters', Icons.settings, FiltersScreen.route,
              onTap: () {
            Navigator.pushReplacementNamed(context, FiltersScreen.route);
          }),
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

  Widget buildListTile(
      BuildContext context, String title, IconData icon, String identifier,
      {Function onTap}) {
    final textColor = routeIdentifier == identifier
        ? Theme.of(context).accentColor
        : Theme.of(context).textTheme.title.color;
    final opacity = routeIdentifier == identifier ? 1.0 : 0.0;
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(opacity),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 26.0,
          color: textColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
