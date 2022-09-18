import 'package:flutter/material.dart';

import '../widgets/ingredients.dart';
import '../widgets/steps.dart';

import '../dummies/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function toggleFavorites;
  final Function isFavoriteMeal;
  MealDetailScreen(this.toggleFavorites, this.isFavoriteMeal);

  Widget buildSelectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectionTitle(context, 'Ingredients'),
            Ingredients(selectedMeal.steps),
            buildSelectionTitle(context, 'Steps'),
            Steps(selectedMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          (isFavoriteMeal(mealId)) ? Icons.favorite : Icons.favorite_outline,
        ),
        onPressed: () {
          toggleFavorites(mealId);
        },
      ),
    );
  }
}
