import 'package:flutter/material.dart';

import '../dummies/dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static String routeName = '/category_meals';
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'] as String;
    final categoryTitle = routeArgs['title'] as String;
    final categoryMeald = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeald[index].title);
        },
        itemCount: categoryMeald.length,
      ),
    );
  }
}
