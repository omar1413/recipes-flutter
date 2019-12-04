import 'package:flutter/material.dart';
import 'package:recipes/src/dummy-data.dart';
import 'package:recipes/src/models/meal.dart';
import 'package:recipes/src/widgets/meal_item.dart';
import 'package:recipes/src/widgets/skeleton.dart';

import 'meal_details_screen.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> meals;
  static const String route = '/category_meals';

  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> meals;
  bool firstInit = false;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: Text(title),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return MealItem(
            id: meal.id,
            imageUrl: meal.imageUrl,
            title: meal.title,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            onTap: _selectMeal,
          );
        },
        itemCount: meals.length,
      ),
    );
  }

  void _selectMeal(String id) {
    Navigator.pushNamed(context, MealDetailsScreen.route, arguments: id);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!firstInit) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = routeArgs['id'];
      title = routeArgs['title'];
      meals = widget.meals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      firstInit = true;
    }
  }
}
