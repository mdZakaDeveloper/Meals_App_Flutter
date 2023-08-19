import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';


enum Filter { glutinFree, lactoseFree, vegetarian, vegan }


final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filter, bool>>((ref) => FiltersNotifier());

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{

  FiltersNotifier() : super({
     Filter.glutinFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian: false,
    Filter.vegan : false
  });

  void setFilter(Filter filter, bool isActive){
    // Mutating values in the memory is not allowed under the StateNotifier Class

    state = { 
      ...state,
      filter : isActive
    };
  }

  void setFilters(Map<Filter, bool> choosenFilters){
    state = choosenFilters;
  }

}

final filteredMealsProvider = Provider((ref) {

  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
      if(activeFilters[Filter.glutinFree]! && !meal.isGlutenFree){
        return false;
      }

      if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }

      if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }

      if(activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }

      return true; 

    }).toList();


});




