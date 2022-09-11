import 'package:expandable/expandable.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/hostel.dart';

Future<List<HostelType>> fatchMenu() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/hostel.json'));

  List<HostelType> hosteltypes = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<Categories> categories = [];

    //New Boys Hostel
    List<dynamic> items = jsonResponse['New Boys Hostel'];
    items.forEach((element) {
      String header = element['header'];
      String expandableText = element['expandableText'];
      categories
          .add(Categories(header: header, expandableText: expandableText));
    });
    hosteltypes
        .add(HostelType(hostelType: 'New Boys Hostel', categories: categories));

    //Old Boys Hostel
    categories = [];
    items = jsonResponse['Old Boys Hostel'];
    items.forEach((element) {
      String header = element['header'];
      String expandableText = element['expandableText'];
      categories
          .add(Categories(header: header, expandableText: expandableText));
    });
    hosteltypes
        .add(HostelType(hostelType: 'Old Boys Hostel', categories: categories));

    //Girls Hostel
    categories = [];
    items = jsonResponse['Girls Hostel'];
    items.forEach((element) {
      String header = element['header'];
      String expandableText = element['expandableText'];
      categories
          .add(Categories(header: header, expandableText: expandableText));
    });
    hosteltypes
        .add(HostelType(hostelType: 'Girls Hostel', categories: categories));

    return hosteltypes;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class hostelScreen extends StatefulWidget {
  @override
  State<hostelScreen> createState() => _hostelScreenState();
}

class _hostelScreenState extends State<hostelScreen> {
  late Future<List<HostelType>> futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = fatchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: FutureBuilder<List<HostelType>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: TabBar(padding: EdgeInsets.all(0),
                      //isScrollable: true,
                      tabs: [
                        Tab(
                            icon: Icon(Icons.boy_sharp),
                            text: 'New Boys Hostel'),
                        Tab(icon: Icon(Icons.boy_outlined), text: 'Old Boys Hostel'),
                        Tab(icon: Icon(Icons.girl_sharp), text: 'Girls Hostel'),
                      ]),
                ),
              ),
              body: //Center(
                  //child: Image.asset('Assets/UnderC.jpg'),
                  //)
                  //,
                  TabBarView(
                children: [
                  ListView.builder(
                    itemCount: snapshot.data![0].categories.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: ExpandablePanel(
                              header: Text(
                                snapshot.data![0].categories[index].header,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              expanded: Text(
                                snapshot
                                    .data![0].categories[index].expandableText,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              collapsed: Text(''),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![1].categories.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: ExpandablePanel(
                              header: Text(
                                snapshot.data![1].categories[index].header,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              expanded: Text(
                                snapshot
                                    .data![1].categories[index].expandableText,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              collapsed: Text(''),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![2].categories.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: ExpandablePanel(
                              header: Text(
                                snapshot.data![2].categories[index].header,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              expanded: Text(
                                snapshot
                                    .data![2].categories[index].expandableText,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              collapsed: Text(''),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
