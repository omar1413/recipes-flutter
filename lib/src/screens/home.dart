import 'package:flutter/material.dart';
import 'package:recipes/src/widgets/categories_grid.dart';
import 'package:recipes/src/widgets/skeleton.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: const Text('Daily Meals'),
      body: CategoriesGrid(),
    );
  }
}
