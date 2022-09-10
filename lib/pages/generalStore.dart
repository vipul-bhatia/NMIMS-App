import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class generalStoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Store'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Coming Soon!', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}