import 'package:flutter/material.dart';


class Meals {

   final String date;
 final String time;
  final String occ;
  final List li;
  final List<dynamic> evening_menu;

 const Meals(
      {
        required this.date,
        required this.time,
        required this.occ,
        required this.li,
        required this.evening_menu,
});
}