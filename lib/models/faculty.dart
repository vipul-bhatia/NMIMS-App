import 'package:flutter/material.dart';


class Faculties {

  final String profile_img;
  final String img_url;
  final String name; 
  final String department;
  final String sitting_position;
  final String email;
  final String linkedin;
  final String website;
  final String about;

 const Faculties(
      {
        required this.profile_img,
        required this.img_url,
        required this.name,
        required this.department,
        required this.sitting_position,
        required this.email,
        required this.linkedin,
        required this.website,
        required this.about,
});
}


class FacultyPlace {
  final String place;
  final List<Faculties> faculties;

  const FacultyPlace({
    required this.place,
    required this.faculties,
  });
}






















// import 'package:flutter/material.dart';

// class facultyPlace {
//   final String title;
//   final List<facultyDetail> items;

//   const facultyPlace({
//     required this.title,
//     required this.items,
//   });
// }

// class facultyDetail {
  // final String Title;
  // final String details;
  // final String ImageUrl; 
  // final String profileImage;
  // final String number;
  // final String sittingP;
  // final String linkedin;
  // final String email;
  // final String twitter;
  // final String phone;
  // final String about;
  // final String qualifications;

//   const facultyDetail({
    
//     required this.Title,
//     required this.details,
//     required this.ImageUrl,
//     required this.profileImage,
//     required this.number,
//     required this.sittingP,
//     required this.linkedin,
//     required this.email,
//     required this.twitter,
//     required this.phone,
//     required this.about,
//     required this.qualifications,
//   });
// }