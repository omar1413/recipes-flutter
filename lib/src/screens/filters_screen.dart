import 'package:flutter/material.dart';
import 'package:recipes/src/widgets/app_drawer.dart';
import 'package:recipes/src/widgets/skeleton.dart';

class FiltersScreen extends StatefulWidget {
  static const String route = '/filters';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    super.initState();
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    _glutenFree = widget.currentFilters['gluten'];
  }

  Widget buildSwitchTitle(
    String title,
    String desc,
    bool currentVal,
    Function update,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desc),
      value: currentVal,
      onChanged: (newVal) {
        setState(() {
          update(newVal);
        });
        widget.saveFilters(
          {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      drawer: AppDrawer(FiltersScreen.route),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTitle(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newVal) {
                    _glutenFree = newVal;
                  },
                ),
                buildSwitchTitle(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newVal) {
                    _lactoseFree = newVal;
                  },
                ),
                buildSwitchTitle(
                  'Vegaterian',
                  'Only include vegaterian meals.',
                  _vegetarian,
                  (newVal) {
                    _vegetarian = newVal;
                  },
                ),
                buildSwitchTitle(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newVal) {
                    _vegan = newVal;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
