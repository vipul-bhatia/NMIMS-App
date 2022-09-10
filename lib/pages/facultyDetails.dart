import 'package:app/models/faculty.dart';
import 'package:flutter/material.dart';
import '../pages/faculty.dart';

class facultyDetailsScreen extends StatelessWidget {
  static const routeName = '/faculty-details';

  @override
  Widget build(BuildContext context) {
    final fd = ModalRoute.of(context)!.settings.arguments as facultyDetail;
    return Scaffold(
      appBar: AppBar(
        title: Text(fd.Title),
      ),
    );
  }
}