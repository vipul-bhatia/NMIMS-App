import 'package:flutter/material.dart';




class callNumber {
  final String name;
  final String number;

const callNumber({
  required this.name,
  required this.number,
});
}


class ListType {
  final String listtype;
  final List<callNumber> numbers;

  const ListType({
    required this.listtype,
    required this.numbers,
  });
}