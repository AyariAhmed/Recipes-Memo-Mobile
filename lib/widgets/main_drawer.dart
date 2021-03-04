import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({@required title, @required icon, @required function}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(title: 'Meals', icon: Icons.restaurant, function: null),
          buildListTile(title: 'Filters', icon: Icons.settings, function: null),
        ],
      ),
    );
  }
}
