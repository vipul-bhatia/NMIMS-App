import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'onboardingnew.dart';

class splashPage extends StatefulWidget {
  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          OnboardingScreenWidget()
                                                         )
                                       )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.green,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 4, 0),
              child: Container(
                width: 250,
                height: 190,
                child: Image.asset('Assets/CampusCompanion.png'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
