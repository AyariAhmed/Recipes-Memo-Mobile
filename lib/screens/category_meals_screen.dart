import 'package:flutter/material.dart';
import 'package:recipes_memo/dummy_data.dart';
import 'package:recipes_memo/models/meal.dart';
import 'package:recipes_memo/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];

      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void _removeMeal(String mealId) {
      setState(() {
        displayedMeals.removeWhere((element) => element.id == mealId);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            var meal = displayedMeals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
