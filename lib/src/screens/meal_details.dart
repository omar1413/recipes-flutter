import 'package:flutter/material.dart';
import 'package:recipes/src/widgets/skeleton.dart';

class MealDetails extends StatelessWidget {
  static const String route = '/meal_details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    return Skeleton(
      title: Text('$id'),
      body: Center(
        child: Text('meal id is - $id'),
      ),
    );
  }
}
