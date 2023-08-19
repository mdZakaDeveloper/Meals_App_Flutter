import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (ctx) => MealDetails(
                meal: meal,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.signal_cellular_connected_no_internet_0_bar_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.secondaryContainer),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Oops! An Error Occured',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Try again later:)',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, singleMeal) => MealItem(
                meal: meals[singleMeal],
                onSelectMeal: (context, meal) => selectMeal(context, meal),
              ));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title!),
        ),
        body: content);
  }
}
