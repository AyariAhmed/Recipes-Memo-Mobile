import 'package:flutter/material.dart';
import 'package:recipes_memo/screens/categories_screen.dart';
import 'package:recipes_memo/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('Meals'),
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.category),text: 'Categories',),
          Tab(icon: Icon(Icons.star),text: 'Favorites',),
        ],),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen()
        ],),
      ),
    );
  }
}
