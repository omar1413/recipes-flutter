import 'package:flutter/material.dart';
import 'package:recipes/src/screens/category_meals.dart';
import 'package:recipes/src/screens/meal_details.dart';

import 'screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: Home(),
      routes: {
        CategoryMeals.route: (_) => CategoryMeals(),
        MealDetails.route: (_) => MealDetails(),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (_) {
            return Home();
          },
        );
      },
    );
  }
}
