import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CatagoryMealsScreen extends StatefulWidget {
  static const routeName = '/catagories-meals';
  final List<Meal> availMeals;
  CatagoryMealsScreen(this.availMeals);
  @override
  _CatagoryMealsScreenState createState() => _CatagoryMealsScreenState();
}

class _CatagoryMealsScreenState extends State<CatagoryMealsScreen> {
  String catTitle;
  List<Meal> displayedMeals;
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String catId = args['id'];
    catTitle = args['title'];
    displayedMeals = widget.availMeals.where((meal) {
      return meal.catagories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeItem(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => mealID == meal.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals[index].title,
              imgUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              id: displayedMeals[index].id,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
