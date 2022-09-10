
import 'package:flutter/material.dart';

class CanteenMealType {
  final String title;
  final List<CanteenItem> items;

  const CanteenMealType({
    required this.title,
    required this.items,
  });
}

class CanteenItem {
  final String name;
  final String cost;

  const CanteenItem({
    required this.name,
    required this.cost,
  });
}