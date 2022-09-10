

import 'package:flutter/material.dart';

class event {
  final String title;
  final List<eventDetail> items;

  const event({
    required this.title,
    required this.items,
  });
}

class eventDetail {
  final String Title;
  final String details;
  final String url;
  final String ImageUrl; 

  const eventDetail({
    required this.Title,
    required this.details,
    required this.url,
    required this.ImageUrl,
  });
}