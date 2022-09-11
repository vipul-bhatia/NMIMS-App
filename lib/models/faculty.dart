

import 'package:flutter/material.dart';

class faculty {
  final String title;
  final List<facultyDetail> items;

  const faculty({
    required this.title,
    required this.items,
  });
}

class facultyDetail {
  final String Title;
  final String details;
  final String id;
  final String ImageUrl; 
  final String profileImage;
  final String number;

  const facultyDetail({
    
    required this.Title,
    required this.details,
    required this.id,
    required this.ImageUrl,
    required this.profileImage,
    required this.number,
  });
}