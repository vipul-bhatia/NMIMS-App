import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class theatreScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  backgroundColor: Colors.white,
  title: Text(
    'Theatre',
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
      body: Center(
        child: Image.asset('Assets/UnderC.jpg'),
      ),
    );
  }
}