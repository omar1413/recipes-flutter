import 'package:flutter/material.dart';
import 'package:recipes/src/models/category.dart';
import 'package:recipes/src/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void selectCategory(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) {
          return CategoryMeals(category.id, category.title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ClickableCard(
      title: category.title,
      color: category.color,
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        selectCategory(context);
      },
    );
  }
}

class _ClickableCard extends StatelessWidget {
  final String title;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final Function onTap;

  _ClickableCard({
    @required this.title,
    @required this.color,
    @required this.borderRadius,
    @required this.onTap,
  }) : assert(title != null && color != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
