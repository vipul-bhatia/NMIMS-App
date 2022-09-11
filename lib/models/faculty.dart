

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
  final String ImageUrl; 
  final String profileImage;
  final String number;
  final String sittingP;
  final String linkedin;
  final String email;
  final String twitter;
  final String phone;
  final String about;
  final String qualifications;

  const facultyDetail({
    
    required this.Title,
    required this.details,
    required this.ImageUrl,
    required this.profileImage,
    required this.number,
    required this.sittingP,
    required this.linkedin,
    required this.email,
    required this.twitter,
    required this.phone,
    required this.about,
    required this.qualifications,
  });
}