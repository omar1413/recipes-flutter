import 'package:flutter/material.dart';
import 'package:recipes/src/dummy-data.dart';
import 'package:recipes/src/screens/category_meals_screen.dart';
import 'package:recipes/src/screens/filters_screen.dart';
import 'package:recipes/src/screens/meal_details_screen.dart';
import 'package:recipes/src/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Meal> meals = DUMMY_MEALS;
  List<Meal> favouritesMeals = [];

  void _addFavouriteMeal(String mealId) {
    Meal meal = meals.firstWhere((meal) => meal.id == mealId);
    setState(() {
      favouritesMeals.add(meal);
    });
  }

  void _removeFavouriteMeal(String mealId) {
    setState(() {
      favouritesMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  bool _isFavourite(String mealId) {
    return favouritesMeals.any((meal) => meal.id == mealId);
  }

  Map<String, bool> filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      this.filters = filters;
      meals = DUMMY_MEALS.where((meal) {
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
      home: TabsScreen(favouritesMeals),
      routes: {
        CategoryMealsScreen.route: (_) => CategoryMealsScreen(meals),
        MealDetailsScreen.route: (_) => MealDetailsScreen(
              addFavouriteMeal: _addFavouriteMeal,
              removeFavouriteMeal: _removeFavouriteMeal,
              isFavouriteMeal: _isFavourite,
            ),
        FiltersScreen.route: (_) => FiltersScreen(filters, _setFilters),
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
