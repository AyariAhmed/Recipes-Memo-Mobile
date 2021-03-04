import 'package:flutter/material.dart';
import 'package:recipes_memo/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;

  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = true;
  bool _vegan = false;
  bool _vegetarian = true;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      {@required String title,
      @required bool value,
      @required String subtitle}) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [IconButton(icon: Icon(Icons.save), onPressed: () => widget.saveFilters())],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    title: 'Gluten-Free',
                    value: _glutenFree,
                    subtitle: 'Only include gluten-free meals'),
                _buildSwitchListTile(
                    title: 'Vegan',
                    value: _vegan,
                    subtitle: 'Only include vegan meals'),
                _buildSwitchListTile(
                    title: 'Vegetarian',
                    value: _vegetarian,
                    subtitle: 'Only include vegetarian meals'),
                _buildSwitchListTile(
                    title: 'Lactose-Free',
                    value: _lactoseFree,
                    subtitle: 'Only include lactose-free meals'),
              ],
            ))
          ],
        ));
  }
}
