import 'package:app/models/academics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/academics.dart';

class academicsDetailScreen extends StatefulWidget {
  static const routeName = '/academics-details';

  @override
  _academicsDetailScreenState createState() => _academicsDetailScreenState();
}

class _academicsDetailScreenState extends State<academicsDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final ad = ModalRoute.of(context)!.settings.arguments as academicsDetail;
   return Scaffold(
appBar:AppBar(
         iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
  backgroundColor: Colors.white,
  title: Text(
    ad.Title,
    style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
  ),
  actions: [],

  elevation: 0,
),
    );
  }
}
