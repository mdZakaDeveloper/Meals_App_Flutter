import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/favotites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeal.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    content: Text(
                      wasAdded ? 'Meal added as a Favorite' : 'Meal is removed',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                    )));
              },
              // Using an Implicit Transition
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    RotationTransition(turns: Tween(begin: 0.9 , end: 1.0).animate(animation), child: child),
                child: Icon(isFavorite ? Icons.star : Icons.star_border, key: ValueKey(isFavorite),),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Hero(
                    tag: meal.id,
                    child: Image.network(
                      meal.imageUrl,
                      width: 350,
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 10,
                      width: 220,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                        Theme.of(context).colorScheme.onSurface,
                        Theme.of(context).colorScheme.primary
                      ])))),
                  const SizedBox(height: 10),
                  Text(
                    'Ingredients :',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (final ingredient in meal.ingredients)
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        '•  $ingredient.',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontStyle: FontStyle.normal,
                            fontSize: 15),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 10,
                      width: 220,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                        Theme.of(context).colorScheme.onSurface,
                        Theme.of(context).colorScheme.primary
                      ])))),
                  const SizedBox(height: 10),
                  Text(
                    'Steps to make :',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (final step in meal.steps)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        '•  $step.',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            letterSpacing: 0.40),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
