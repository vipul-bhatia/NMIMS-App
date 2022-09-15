import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/documents.dart';


Future<List<documentType>> fatchDocument() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/documents.json'));

  List<documentType> documenttypes = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<document> documentss  = [];

    //Hostel
    List<dynamic> items = jsonResponse['hostel'];
    items.forEach((element) {
      String documenttype = element['documenttype'];
      String documents = element['documents'];
      documentss.add(document(Description: documents));
    });
    documenttypes.add(documentType(documenttype: "hostel", documents: documentss));

    //Academics
    documentss = [];
    items = jsonResponse['academics'];
    items.forEach((element) {
      String documenttype = element['documenttype'];
      String documents = element['documents'];
      documentss.add(document(Description: documents));
    });
    documenttypes.add(documentType(documenttype: "academics", documents: documentss));

    //Library
    documentss = [];
    items = jsonResponse['library'];
    items.forEach((element) {
      String documenttype = element['documenttype'];
      String documents = element['documents'];
      documentss.add(document(Description: documents));
    });
    documenttypes.add(documentType(documenttype: "library", documents: documentss));

    //Laundary
    documentss = [];
    items = jsonResponse['laundary'];
    items.forEach((element) {
      String documenttype = element['documenttype'];
      String documents = element['documents'];
      documentss.add(document(Description: documents));
    });
    documenttypes.add(documentType(documenttype: "laundary", documents: documentss));


  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw  Center(
            child: Image.asset("Assets/nointernet.jpg")
          );
  }
  return documenttypes;
}








class documentScreen extends StatefulWidget {
  @override
  State<documentScreen> createState() => _documentScreenState();
}

class _documentScreenState extends State<documentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: FutureBuilder<List<documentType>>(
          future: fatchDocument(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Document"),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.hotel),
                        text: "Hostel",
                      ),
                      Tab(
                         icon: Icon(Icons.school_outlined),
                        text: "Academics",
                      ),
                      Tab(
                        icon: Icon(Icons.library_books),
                        text: "Library",
                      ),
                      Tab(
                        icon: Icon(Icons.local_laundry_service),
                        text: "Laundary",
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: snapshot.data![0].documents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 20.0,
                                        shadowColor: Colors.blue,
                            child: ListTile(
                              title: Text(snapshot.data![0].documents[index].Description,style: TextStyle(fontSize: 28),),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: snapshot.data![1].documents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Material(
                            elevation: 20.0,
                                        shadowColor: Colors.blue,
                            child: ListTile(
                              title: Text(snapshot.data![1].documents[index].Description,style: TextStyle(fontSize: 28),),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: snapshot.data![2].documents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Material(
                            elevation: 20.0,
                                        shadowColor: Colors.blue,
                            child: ListTile(
                              title: Text(snapshot.data![2].documents[index].Description,style: TextStyle(fontSize: 28),),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: snapshot.data![3].documents.length,
                      itemBuilder: (context, index) {
                        return Padding( 
                          padding: const EdgeInsets.all(6.0),
                          child: Material(
                            elevation: 20.0,
                                        shadowColor: Colors.blue,
                            child: ListTile(
                              title: Text(snapshot.data![3].documents[index].Description,style: TextStyle(fontSize: 28),),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return  Center(
            child: Image.asset("Assets/nointernet.jpg")
          );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
