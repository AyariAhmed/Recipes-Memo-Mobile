import 'package:flutter/material.dart';
import 'package:recipes_memo/models/meal.dart';
import 'package:recipes_memo/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('You have no Favorites yet - Start Adding Some!'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount:favoriteMeals.length,
      );
    }

  }
}
