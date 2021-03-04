import 'package:flutter/material.dart';
import 'package:recipes_memo/dummy_data.dart';
import 'package:recipes_memo/models/meal.dart';
import 'package:recipes_memo/screens/categories_screen.dart';
import 'package:recipes_memo/screens/category_meals_screen.dart';
import 'package:recipes_memo/screens/filters_screen.dart';
import 'package:recipes_memo/screens/meal_detail_screen.dart';
import 'package:recipes_memo/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters= {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals=DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree) return false;
        if(_filters['lactose'] && !meal.isLactoseFree) return false;
        if(_filters['vegan'] && !meal.isVegan) return false;
        if(_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();

    });
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      /*home: CategoriesScreen(),*/
      initialRoute: '/', // default is '/'
      routes: {
          /*'/' : (ctx) => CategoriesScreen(),*/
          TabsScreen.routeName : (ctx) => TabsScreen(), // '/'
          CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
          FiltersScreen.routeName : (ctx) => FiltersScreen(_filters,_setFilters)
      },
      /*onGenerateRoute: (settings){
        print(settings.arguments);
        if(settings.name == '/meal-detail')
          return MaterialPageRoute(builder: (ctx)=> MealDetailScreen());
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },*/
      onUnknownRoute: (setting){
        // onUnknownRoute is used as a last Resort when no route is found
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

