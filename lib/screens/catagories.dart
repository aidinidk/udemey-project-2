import 'package:flutter/material.dart';
import 'package:meals/data/dummey_data.dart';
import 'package:meals/models/catagory.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/catagory_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availabelMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availabelMeals;

  void _selectCatagory(BuildContext context, Category catagory) {
    final filteredMeals = availabelMeals
        .where((meal) => meal.categories.contains(catagory.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: catagory.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCatagory: () {
              _selectCatagory(context, category);
            },
          )
      ],
    );
  }
}
