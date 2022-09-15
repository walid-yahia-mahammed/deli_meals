import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = "/filters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
