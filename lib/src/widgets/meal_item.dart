import 'package:flutter/material.dart';
import 'package:recipes/src/models/meal.dart';
import 'package:recipes/src/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void _selectMeal(BuildContext ctx) {
    Navigator.pushNamed(ctx, MealDetails.route, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15.0),
                    color: Colors.black54,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 250.0, maxHeight: 100.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _IconTitle('$duration', Icons.schedule),
                  _IconTitle(complexityText, Icons.work),
                  _IconTitle(affordabilityText, Icons.attach_money),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IconTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }

  _IconTitle(
    this.title,
    this.icon,
  );
}
