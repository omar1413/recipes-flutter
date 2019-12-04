import 'package:flutter/material.dart';
import 'package:recipes/src/models/meal.dart';
import 'package:recipes/src/widgets/meal_item.dart';
import 'package:recipes/src/widgets/skeleton.dart';

import 'meal_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavoritesScreen(this.favouriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.favouriteMeals.length == 0
          ? Text('no favourites yet')
          : ListView.builder(
              itemBuilder: (ctx, index) {
                final meal = widget.favouriteMeals[index];
                return MealItem(
                  id: meal.id,
                  imageUrl: meal.imageUrl,
                  title: meal.title,
                  duration: meal.duration,
                  complexity: meal.complexity,
                  affordability: meal.affordability,
                  onTap: (id) => _selectMeal(context, id),
                );
              },
              itemCount: widget.favouriteMeals.length,
            ),
    );
  }

  void _selectMeal(BuildContext context, String id) {
    Navigator.pushNamed(context, MealDetailsScreen.route, arguments: id);
  }
}
