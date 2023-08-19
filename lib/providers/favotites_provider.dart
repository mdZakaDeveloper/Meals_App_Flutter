import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) => FavoriteMealsNotifier());

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealFavorite = state.contains(meal);

    if (mealFavorite) {
     
      state = state.where((m) => m.id != meal.id).toList();
      return false;  // Indicate that the meal is no longer a favorite.
    } else {
      state = [...state , meal];
      return true;  // Indicate that the meal is now a favorite.
    }

  }
}
