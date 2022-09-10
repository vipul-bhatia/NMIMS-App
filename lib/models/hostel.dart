import 'package:flutter/material.dart';


class Categories {

   final String header;
 final String expandableText;

 const Categories(
      {
      required this.header,
      required this.expandableText,
});
}


class HostelType {
  final String hostelType;
  final List<Categories> categories;

  const HostelType({
    required this.hostelType,
    required this.categories,
  });
}