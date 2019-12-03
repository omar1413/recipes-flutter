import 'package:flutter/material.dart';
import 'package:recipes/src/screens/category_meals_screen.dart';
import 'package:recipes/src/screens/filters_screen.dart';
import 'package:recipes/src/screens/meal_details_screen.dart';
import 'package:recipes/src/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';

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
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.route: (_) => CategoryMealsScreen(),
        MealDetailsScreen.route: (_) => MealDetailsScreen(),
        FiltersScreen.route: (_) => FiltersScreen(),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
