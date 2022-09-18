import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filters";
  final Map<String, bool> currentFilters;
  final Function setFilters;

  FiltersScreen(
    this.currentFilters,
    this.setFilters,
  );
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subTitle, bool curentValue, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: curentValue,
      onChanged: (value) {
        update(value);
      },
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions: [
          IconButton(
            onPressed: () {
              widget.setFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjest your meal selections',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                left: 20,
                right: 50,
                top: 30,
              ),
              children: [
                _buildSwitchListTile(
                    'Gluten_free', 'only show gluten_free meals', _glutenFree,
                    (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchListTile('Lactose_free',
                    'only show lactose_free meals', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _buildSwitchListTile('Vegan', 'only show vegan meals', _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'only show vegetarian meals', _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
