import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/favotites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/side_drawer.dart';


const kInitialFilters = {   // Defined Global Variable
    Filter.glutinFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian: false,
    Filter.vegan : false
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context)
          .push<Map<Filter, bool>>(
            MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    } 
  }



 

  @override
  Widget build(BuildContext context) {

  
    
    final availableMeals = ref.watch(filteredMealsProvider);


    Widget activeScreen = CategoryScreen(
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      var index = favoriteMeals.length;
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_rounded), label: 'Favorites')
          ]),
    );
  }
}
