import 'package:flutter/material.dart';


class document {


 final String Description ;

 const document(
      {

      required this.Description,
});
}


class documentType {
  final String documenttype;
  final List<document> documents;

  const documentType({
    required this.documenttype,
    required this.documents,
  });
}