import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/events.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

Future<List<eventDetail>> eventsDetails() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/vipul-bhatia/nmimsdata/master/datafiles/events.json'));

  String title = "Events";
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<eventDetail> eventdetails = [];
    List<dynamic> events = jsonResponse['Events'];
    events.forEach((element) {
      String Title = element['Title'];
      String details = element['details'];
      String url = element['url'];
      String ImageUrl = element['ImageUrl'];
      eventdetails.add(eventDetail(
          Title: Title, details: details, url: url, ImageUrl: ImageUrl));
    });
    return eventdetails;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Center(child: Image.asset("Assets/nointernet.jpg"));
  }
}

class eventsScreen extends StatefulWidget {
  @override
  State<eventsScreen> createState() => _eventsScreenState();
}

class _eventsScreenState extends State<eventsScreen> {
  late Future<List<eventDetail>> futureMenu;
  @override
  void initState() {
    super.initState();
    futureMenu = eventsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
  backgroundColor: Colors.greenAccent,
  title: Text(
    'Events',
    style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Color(0xFF090F13),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
  ),
  actions: [],
  elevation: 0,
),


      body: FutureBuilder<List<eventDetail>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => futureMenu,
              child: ListView.builder(
itemCount: snapshot.data!.length,
               itemBuilder: (context, index) {
                   return 
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                            child: Container(
                              width: double.infinity,
                              height: 184,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(
                                      snapshot.data![index].ImageUrl),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x65090F13),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 2),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data![index].Title,
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            IconButton(onPressed: (){},splashColor: Colors.greenAccent,icon: Icon(Icons.chevron_right_outlined,color: Colors.white, size: 30,),)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data![index].details,
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF39D2C0),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.greenAccent,
                                                  onPrimary: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  launch(snapshot.data![index].url);
                                                },
                                                label: Text('Reserve'),
                                                icon: Icon(
                                                  Icons.add_rounded,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Text(
                                                        '10:00am',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Thursday June 22',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xB4FFFFFF),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                },
              ),
              // child: ListView.builder(
              //   itemCount: snapshot.data!.length,
              //   itemBuilder: (context, index) {
              //     return InkWell(
              //       highlightColor: Colors.blueAccent,
              //       splashColor: Colors.blueAccent,
              //       onTap: () => launch(snapshot.data![index].url),
              //       child: Card(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //         elevation: 4,
              //         margin: EdgeInsets.all(10),
              //         child: Column(
              //           children: [
              //             Stack(
              //               children: [
              //                 ClipRRect(
              //                   borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(15),
              //                     topRight: Radius.circular(15),
              //                   ),
              //                   child: Image.network(
              //                     snapshot.data![index].ImageUrl,
              //                     height: 250,
              //                     width: double.infinity,
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //                 Positioned(
              //                   bottom: 20,
              //                   right: 10,
              //                   child: Container(
              //                     width: 300,
              //                     color: Colors.black54,
              //                     padding: EdgeInsets.symmetric(
              //                       vertical: 5,
              //                       horizontal: 20,
              //                     ),
              //                     child: Text(
              //                       snapshot.data![index].Title,
              //                       style: TextStyle(
              //                           fontSize: 20, color: Colors.white),
              //                       softWrap: true,
              //                       overflow: TextOverflow.fade,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Padding(
              //               padding: EdgeInsets.all(20),
              //               child: ListTile(
              //                 title: Text(
              //                   snapshot.data![index].details,
              //                   style: TextStyle(fontSize: 23),
              //                 ),
              //                 trailing: IconButton(
              //                     onPressed: () {
              //                       launch(snapshot.data![index].url);
              //                     },
              //                     icon: Icon(Icons.launch)),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Image.asset("Assets/nointernet.jpg"));
          }
          // By default, show a loading spinner.
          return Center(
            child: LoadingAnimationWidget.threeRotatingDots(
                color: Colors.white, size: 50),
          );
        },
      ),
    );
  }
}
