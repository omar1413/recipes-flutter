import 'package:flutter/material.dart';
import 'package:recipes/src/widgets/category_item.dart';
import '../dummy-data.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES.map((ele) {
        return CategoryItem(ele);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
