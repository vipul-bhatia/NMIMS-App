import 'package:expandable/expandable.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
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
    throw  Center(
            child: LottieBuilder.asset('Assets/no-internet.json')
          );
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
                 iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
                title: Text('Hostel',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(padding: EdgeInsets.all(0),
                    //isScrollable: true,
                    tabs: [
                      Tab(
                          icon: Icon(Icons.boy_sharp,color: Color(0xFF4B39EF),),
                          child: Text(
                              "New Boys",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                      Tab(icon: Icon(Icons.boy_outlined,color: Color(0xFF4B39EF),),  child: Text(
                              "Old Boys",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                      Tab(icon: Icon(Icons.girl_sharp,color: Color(0xFF4B39EF),),  child: Text(
                              "Girls Hostel",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                    ]),
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
            return  Center(
            child: LottieBuilder.asset('Assets/no-internet.json')
          );
          }
          return LoadingAnimationWidget.threeRotatingDots(color: Color(0xFF4B39EF), size: 50);
        },
      ),
    );
  }
}
