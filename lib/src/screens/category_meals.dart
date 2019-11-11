import 'package:flutter/material.dart';
import 'package:recipes/src/widgets/skeleton.dart';

class CategoryMeals extends StatelessWidget {
  final String id;
  final String title;

  CategoryMeals(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: Text(title),
      body: Text('new widget'),
    );
  }
}
