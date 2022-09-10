import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class theatreScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theatre'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset('Assets/UnderC.jpg'),
      ),
    );
  }
}