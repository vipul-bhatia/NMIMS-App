import 'package:app/pages/eventsDetails.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
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
    throw Center(child: LottieBuilder.asset('Assets/no-internet.json'));
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

  void selectEvent(BuildContext ctx, eventDetail ed) {
    Navigator.of(ctx).pushNamed(
      EventdetailsWidget.routeName,
      arguments: ed,
    );
    // Navigator.of(ctx).pushNamed(
    //   CategoryMealsScreen.routeName,
    //   arguments: {
    //     'id': id,
    //     'title': title,
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<eventDetail>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => futureMenu,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                    child: GestureDetector(
                      onTap: () {
                        selectEvent(context, snapshot.data![index]);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(snapshot.data![index].ImageUrl),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
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
                                      
                                    ],
                                  ),
                                ),
                               
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 16, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  '10:00am',
                                                  style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Thursday June 22',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xB4FFFFFF),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ElevatedButton.icon(
                                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF4B39EF))),
                                                  onPressed: () => selectEvent(
                                            context, snapshot.data![index]),
                                                  icon: Icon(Icons.arrow_forward_ios,size: 20,),
                                                  label: Text(('Know More')))
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
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: LottieBuilder.asset('Assets/no-internet.json'));
          }
          // By default, show a loading spinner.
          return Center(
            child: LoadingAnimationWidget.threeRotatingDots(
                color: Color(0xFF4B39EF), size: 50),
          );
        },
      ),
    );
  }
}
