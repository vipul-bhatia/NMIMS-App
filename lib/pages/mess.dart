import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import '../models/messmeals.dart';

Future<List<Meals>> fatchMenu() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/aamit2267/try-act/main/data.json'));

  List<Meals> meals = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<Meals> mealss = [];

    List<dynamic> items = jsonResponse['meal'];
    items.forEach((element) {
      String date = element['date'];
      String time = element['time'];
      String occ = element['occ'];
      List li = element['li'];
      List<dynamic> evening_menu = [];
      if (occ == " Evening") {
        element['td'].forEach((key, value) {
          li.add(key + ' - Rs ' + value);
        });

        mealss.add(Meals(
            date: date,
            time: time,
            occ: occ,
            li: li,
            evening_menu: evening_menu));
      } else {
        mealss.add(Meals(
            date: date,
            time: time,
            occ: occ,
            li: li,
            evening_menu: evening_menu));
      }
    });
    return mealss;
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
              
              body: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF4B39EF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Mess Menu',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(snapshot.data![0].date,style: TextStyle(fontSize: 18),),
                  ),
                  Center(
                    child: Text(snapshot.data![0].time,style: TextStyle(fontSize: 18),),
                  ),
                  Center(
                    child: Text(snapshot.data![0].occ,style: TextStyle(fontSize: 18),),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 10,
                      child: ListView.builder(
                        itemCount: snapshot.data![0].li.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![0].li[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Container(
                  //     child: Text(
                  //   snapshot.data![0].date,
                  // )),
                  // Container(
                  //     child: Text(
                  //   snapshot.data![0].time,
                  // )),
                  // Container(
                  //     child: Text(
                  //   snapshot.data![0].occ,
                  // )),
                ],
              ),
              // body: Center(
              //   child: ListView.builder(
              //     itemCount: snapshot.data!.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         child: Column(
              //           children: [
              //             Container(
              //               padding: EdgeInsets.all(10),
              //               child: Text(
              //                 snapshot.data![index].date,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.all(10),
              //               child: Text(
              //                 snapshot.data![index].time,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.all(10),
              //               child: Text(
              //                 snapshot.data![index].occ,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              // ListView.builder(
              //     itemCount: snapshot.data![index].li.length,
              //     itemBuilder: (context, index1) {
              //       return Container(
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           snapshot.data![index].li[index1],
              //           style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       );
              //     })
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // )

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
            return Center(
                child: LottieBuilder.asset('Assets/no-internet.json'));
          }
          // By default, show a loading spinner.
          return LoadingAnimationWidget.threeRotatingDots(
              color: Color(0xFF4B39EF), size: 50);
        });
  }
}
