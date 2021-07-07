import 'package:flutter/material.dart';
import 'package:meals/screens/catagory_meals_screen.dart';

class CatagoryItem extends StatelessWidget {
  void selectCatagories(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatagoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  final String id;
  final String title;
  final Color color;
  CatagoryItem({this.id, this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagories(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
