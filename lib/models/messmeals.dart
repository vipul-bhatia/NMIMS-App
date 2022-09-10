import 'package:flutter/material.dart';


class Meals {

   final String title;
 final String Description ;

 const Meals(
      {
      required this.title,
      required this.Description,
});
}


class MealType {
  final String mealtype;
  final List<Meals> meals;

  const MealType({
    required this.mealtype,
    required this.meals,
  });
}