import 'package:flutter/material.dart';
import 'package:recipes_memo/screens/categories_screen.dart';
import 'package:recipes_memo/screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          '/' : (ctx) => CategoriesScreen(),
          CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
      },
    );
  }
}

