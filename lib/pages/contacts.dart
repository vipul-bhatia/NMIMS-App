import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/contacts.dart';

Future<List<ListType>> fatchcallnumber() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/contacts.json'));

  List<ListType> listtypes = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<callNumber> listtypess = [];

    //Boys Hostel
    List<dynamic> items = jsonResponse['Boys Hostel'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "hostel", numbers: listtypess));

    //Girls Hostel
    listtypess = [];
    items = jsonResponse['Girls Hostel'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "Girls Hostel", numbers: listtypess));

    //Doctors
    listtypess = [];
    items = jsonResponse['Doctors'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "Doctors", numbers: listtypess));

    //Travellers
    listtypess = [];
    items = jsonResponse['Travellers'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "Travellers", numbers: listtypess));

    //Top Level Managment
    listtypess = [];
    items = jsonResponse['Top Level Managment'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes
        .add(ListType(listtype: "Top Level Managment", numbers: listtypess));

    //Others
    listtypess = [];
    items = jsonResponse['Others'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "Others", numbers: listtypess));

    //Gym Trainer
    listtypess = [];
    items = jsonResponse['Gym Trainer'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "Gym Trainer", numbers: listtypess));

    //Yoga Instructor
    listtypess = [];
    items = jsonResponse['Yoga Instructor'];
    items.forEach((element) {
      String listtype = element['listtype'];
      String name = element['name'];
      String number = element['number'];
      listtypess.add(callNumber(name: name, number: number));
    });
    listtypes.add(ListType(listtype: "Yoga Instructor", numbers: listtypess));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw  Center(
            child: LottieBuilder.asset('Assets/no-internet.json')
          );
  }
  return listtypes;
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: FutureBuilder<List<ListType>>(
        future: fatchcallnumber(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                 iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
                backgroundColor: Colors.white,
               title: Text(
    'Contacts',
    style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
  ),
  elevation: 0,
                bottom: TabBar(
                 labelColor: Colors.black,
                 indicatorColor: Color(0xFF4B39EF),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Boys Hostel",
                    ),
                    Tab(
                      text: "Girls Hostel",
                    ),
                    Tab(
                      text: "Doctors",
                    ),
                    Tab(
                      text: "Travellers",
                    ),
                    Tab(
                      text: "Top Level Managment",
                    ),
                    Tab(
                      text: "Others",
                    ),
                    Tab(
                      text: "Gym Trainer",
                    ),
                    Tab(
                      text: "Yoga Instructor",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: snapshot.data![0].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![0].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![0].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                 launch(
                                    "tel:${snapshot.data![0].numbers[index].number}");
                               // launch(
                                 //   "tel:${snapshot.data![0].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![1].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![1].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![1].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![1].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![2].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![2].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![2].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![2].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![3].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![3].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![3].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color:Color(0xFF4B39EF)),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![3].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![4].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![4].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![4].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![4].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![5].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![5].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![5].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![5].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![6].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![6].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![6].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![6].numbers[index].number}");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![7].numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 20.0,
                          shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![7].numbers[index].name),
                            subtitle:
                                Text(snapshot.data![7].numbers[index].number),
                            trailing: IconButton(
                              icon: Icon(Icons.call,color: Color(0xFF4B39EF),),
                              onPressed: () {
                                launch(
                                    "tel:${snapshot.data![7].numbers[index].number}");
                              },
                            ),
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
            child: LottieBuilder.asset('Assets/no-internet.json')
          );
          }
          return Center(child: LoadingAnimationWidget.threeRotatingDots(color: Color(0xFF4B39EF), size: 50),);
        },
      ),
    );
  }
}
