import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';

class CategoryGridItem extends StatelessWidget{

  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(8.0),
      splashColor: Theme.of(context).colorScheme.primaryContainer,
      child: Container( 
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.40),
            category.color,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft)
        ),
        child: Text(category.title, style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        )),
      ),
    );
  }
}


