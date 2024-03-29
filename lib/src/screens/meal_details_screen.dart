import 'package:flutter/material.dart';
import 'package:recipes/src/dummy-data.dart';
import 'package:recipes/src/widgets/frame_image.dart';
import 'package:recipes/src/widgets/skeleton.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String route = '/meal_details';

  final Function(String) addFavouriteMeal;
  final Function(String) removeFavouriteMeal;
  final bool Function(String) isFavouriteMeal;

  MealDetailsScreen({
    @required this.addFavouriteMeal,
    @required this.removeFavouriteMeal,
    @required this.isFavouriteMeal,
  });

  Widget buildTitleSection(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(ListView listView) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 300,
        child: listView);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Skeleton(
      title: Text('$id'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250.0,
              child: FrameImage(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleSection(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildTitleSection(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text('${meal.title}'),
                    ),
                    Divider(color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavouriteMeal(id) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          print('clicked');
          if (isFavouriteMeal(id)) {
            print('clicked1');

            removeFavouriteMeal(id);
          } else {
            print('clicked2');
            addFavouriteMeal(id);
          }
        },
      ),
    );
  }
}
