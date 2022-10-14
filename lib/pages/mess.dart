import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import '../models/messmeals.dart';

Future<List<Meals>> fatchMenu() async{
  final response = await http.get(Uri.parse('https://raw.githubusercontent.com/aamit2267/try-act/main/data.json?token=GHSAT0AAAAAABV6VV5GMZSGGTMTN6GZCNFGY2IJA4A'));

  List<Meals> meals = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<Meals> mealss  = [];

    //Breakfast
    List<dynamic> items = jsonResponse['meal'];
    items.forEach((element) {
      String date = element['date'];
      String time = element['time'];
      String occ = element['occ'];
      String li = element['li'];
      mealss.add(Meals(date: date, time: time, occ: occ, li: li));
    });
    meals.add(Meals(date: "", time: "", occ: "", li: ""));
    return meals;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
// Future<List<MealType>> fatchMenu() async {
//   final response = await http.get(Uri.parse(
//       'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/messmenu.json'));

//   List<MealType> mealtypes = [];

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     var jsonResponse = jsonDecode(response.body);
//     List<Meals> meals = [];

//     //Brealfast
//     List<dynamic> items = jsonResponse['Meals'];
//     items.forEach((element) {
//       String date = element['date'];
//       String time = element['time'];
//       String occ = element['occ'];
//       String li = element['li'];
//       String td = element['td'];
//       meals.add(Meals(
//           date: date, time: time, occ: occ, li: li, td: td));
//     });
//     mealtypes.add(MealType(meals: meals));

//     return mealtypes;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Center(child: LottieBuilder.asset('Assets/no-internet.json'));
//   }
// }
  }
}
class messScreen extends StatefulWidget {
  @override
  State<messScreen> createState() => _messScreenState();
}

class _messScreenState extends State<messScreen> {
  late Future<List<Meals>> futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = fatchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Meals>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(20),
                //   child: TabBar(
                //       padding: EdgeInsets.all(0),
                //       //isScrollable: true,
                //       tabs: [
                //         Tab(
                //             icon: Icon(Icons.breakfast_dining,color:Color(0xFF4B39EF) ,),
                //             child: Text(
                //               "Breakfast",
                //               style: TextStyle(
                //                   fontSize: 16, color: Colors.black),
                //             )),
                //         Tab(icon: Icon(Icons.lunch_dining,color:Color(0xFF4B39EF)),child: Text(
                //               "Lunch",
                //               style: TextStyle(
                //                   fontSize: 16, color: Colors.black),
                //             )),
                //         Tab(icon: Icon(Icons.dinner_dining,color:Color(0xFF4B39EF)), child: Text(
                //               "Dinner",
                //               style: TextStyle(
                //                   fontSize: 16, color: Colors.black),
                //             )),
                //       ]),
                // ),
              ),
              body: Center(child: ListView.builder(itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: Text(
                        //     snapshot.data![index].meals[0].date,
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: Text(
                        //     snapshot.data![index].meals[0].time,
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: Text(
                        //     snapshot.data![index].meals[0].occ,
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            snapshot.data![index].li,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },

              ),)
















              // body: TabBarView(
              //   children: [
              //     RefreshIndicator(
              //       onRefresh: () => fatchMenu(),
              //       child: ListView.builder(
              //         itemCount: snapshot.data![0].meals.length,
              //         itemBuilder: (ctx, index) => Card(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 5,
              //               horizontal: 10,
              //             ),
              //             child: Material(
              //               elevation: 20.0,
              //               shadowColor: Colors.blue,
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(
              //                   vertical: 5,
              //                   horizontal: 10,
              //                 ),
              //                 child: ListTile(
              //                   title: Text(
              //                       snapshot.data![0].meals[index].title),
              //                   subtitle: Text(snapshot
              //                       .data![0].meals[index].Description),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     RefreshIndicator(
              //       onRefresh: () => fatchMenu(),
              //       child: ListView.builder(
              //         itemCount: snapshot.data![1].meals.length,
              //         itemBuilder: (ctx, index) => Card(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 5,
              //               horizontal: 10,
              //             ),
              //             child: Material(
              //               elevation: 20.0,
              //               shadowColor: Colors.blue,
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(
              //                   vertical: 5,
              //                   horizontal: 10,
              //                 ),
              //                 child: ListTile(
              //                   title: Text(
              //                       snapshot.data![1].meals[index].title),
              //                   subtitle: Text(snapshot
              //                       .data![1].meals[index].Description),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     RefreshIndicator(
              //       onRefresh: () => fatchMenu(),
              //       child: ListView.builder(
              //         itemCount: snapshot.data![2].meals.length,
              //         itemBuilder: (ctx, index) => Card(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 5,
              //               horizontal: 10,
              //             ),
              //             child: Material(
              //               elevation: 20.0,
              //               shadowColor: Colors.blue,
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(
              //                   vertical: 5,
              //                   horizontal: 10,
              //                 ),
              //                 child: ListTile(
              //                   title: Text(
              //                       snapshot.data![2].meals[index].title),
              //                   subtitle: Text(snapshot
              //                       .data![2].meals[index].Description),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            );
          } else if (snapshot.hasError) {
            return Center(child:LottieBuilder.asset('Assets/no-internet.json'));
          }
          // By default, show a loading spinner.
          return LoadingAnimationWidget.threeRotatingDots(
              color: Color(0xFF4B39EF), size: 50);
        });
  }
}
