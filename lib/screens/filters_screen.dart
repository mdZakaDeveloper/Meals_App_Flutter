import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';


class FiltersScreen extends ConsumerWidget {

  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // }),

      body: Column(children: [
          SwitchListTile(
            value: activeFilters[Filter.glutinFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutinFree, isChecked);
            },
            title: Text(
              'Glutin-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include glutin-free meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: const Color.fromARGB(255, 0, 82, 90),
            contentPadding: const EdgeInsets.only(left: 35, right: 25),
          ),
          SwitchListTile(
             value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: const Color.fromARGB(255, 0, 82, 90),
            contentPadding: const EdgeInsets.only(left: 35, right: 25),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: const Color.fromARGB(255, 0, 82, 90),
            contentPadding: const EdgeInsets.only(left: 35, right: 25),
          ),
          SwitchListTile(
             value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: const Color.fromARGB(255, 0, 82, 90),
            contentPadding: const EdgeInsets.only(left: 35, right: 25),
          ),
        ]),
      );
  }
}

