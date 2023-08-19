import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';

class MainDrawer extends StatelessWidget {

  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier)  onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 139, 198, 236),
                Color.fromARGB(255, 149, 153, 226)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.fastfood_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cook Up',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.dining_rounded,
              size: 30,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onTap: () {

              onSelectScreen('meals');

            },
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onTap: () {
              onSelectScreen('filters');

            },
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
