import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context,Meal meal) onSelectMeal;
   

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1).toLowerCase();
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1).toLowerCase();
  }
   

  


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 30,
      margin: const EdgeInsets.all(20),
      shape:   RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
      splashColor: Theme.of(context).colorScheme.primaryContainer,
        onTap: (){
          onSelectMeal(context,meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
                
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration:  BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.80),
                    
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      
                  
                  child: Column(
                    children: [
                      Text(

                        meal.title,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,


                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          MealItemTrait(icon: Icons.timelapse, label: "${meal.duration} Min"),
                          const SizedBox(width: 8,),
                          MealItemTrait(icon: Icons.work, label: complexityText),
                          const SizedBox(width: 8,),
                          MealItemTrait(icon: Icons.attach_money, label: affordabilityText)
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
