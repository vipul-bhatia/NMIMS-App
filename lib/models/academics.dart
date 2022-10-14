

import 'package:flutter/material.dart';

class academics {
  final String title;
  final List<academicsDetail> items;

  const academics({
    required this.title,
    required this.items,
  });
}

class academicsDetail {
  final String Title;
  final String details;
  final String url;
  final String ImageUrl; 

  const academicsDetail({
    required this.Title,
    required this.details,
    required this.url,
    required this.ImageUrl,
  });
}