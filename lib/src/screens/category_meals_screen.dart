import 'package:flutter/material.dart';
import 'package:recipes/src/dummy-data.dart';
import 'package:recipes/src/widgets/meal_item.dart';
import 'package:recipes/src/widgets/skeleton.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = '/category_meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

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
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
