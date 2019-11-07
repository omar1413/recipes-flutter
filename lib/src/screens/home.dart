import 'package:flutter/material.dart';
import 'package:recipes/src/widgets/categories_grid.dart';
import 'package:recipes/src/widgets/skelton.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Skelton(
      body: CategoriesGrid(),
    );
  }
}
