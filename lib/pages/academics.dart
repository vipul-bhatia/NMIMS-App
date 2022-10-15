
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../models/academics.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/academicsImformation.dart';
Future<List<academicsDetail>> academicsDetails() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/vipul-bhatia/nmimsdata/master/datafiles/academics.json'));

  String title = "Academics";


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<academicsDetail> academicsdetails = [];
    List<dynamic> academics = jsonResponse['Academics'];
    academics.forEach((element) {
      String Title = element['Title'];
      String details = element['details'];
      String url = element['url'];
      String ImageUrl = element['ImageUrl'];
      List<Year> Years = [];
      List<dynamic> years = element['Years'];
      years.forEach((element) {
        String year = element['year'];
        String url = element['url'];
        Years.add(Year(year: year, url: url));
      });

      academicsdetails.add(academicsDetail(
          Title: Title, details: details, url: url, ImageUrl: ImageUrl, Years: Years));
    });
    return academicsdetails;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Center(child: LottieBuilder.asset('Assets/no-internet.json'));
  }
}

class academicsScreen extends StatefulWidget {
  @override
  State<academicsScreen> createState() => _academicsScreenState();
}

class _academicsScreenState extends State<academicsScreen> {
  late Future<List<academicsDetail>> futureMenu;
  @override
  void initState() {
    super.initState();
    futureMenu = academicsDetails();
  }

   void selectCourse(BuildContext ctx, academicsDetail ad) {
    Navigator.of(ctx).pushNamed(
      academicsDetailScreen.routeName,
      arguments: ad,
    );
  // Navigator.of(ctx).pushNamed(
  //   CategoryMealsScreen.routeName,
  //   arguments: {
  //     'id': id,
  //     'title': title,
  }
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<academicsDetail>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => futureMenu,
              child: GridView.builder( gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: MediaQuery.of(context).size.height / 3,
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
            mainAxisSpacing: MediaQuery.of(context).size.width * 0.04,
          ),  itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return  Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () => selectCourse(context, snapshot.data![index]),
                child: Container(
                  child: Column(
                    children: [
                      ClipRRect(
                        
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          snapshot.data![index].ImageUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(4),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data![index].Title,
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF1D2429),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
                },
            
              ),
              //               child: ListView.builder(
              // itemCount: snapshot.data!.length,
              //                itemBuilder: (context, index) {
              //                    return
              //                           Padding(
              //                             padding:
              //                                 EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
              //                             child: GestureDetector(
              //                               onTap: () {
              
              //                               },
              //                               child: Container(
              //                                 width: double.infinity,
              //                                 height: 184,
              //                                 decoration: BoxDecoration(
              //                                   color: Colors.white,
              //                                   image: DecorationImage(
              //                                     fit: BoxFit.fitWidth,
              //                                     image: NetworkImage(
              //                                         snapshot.data![index].ImageUrl),
              //                                   ),
              //                                   boxShadow: [
              //                                     BoxShadow(
              //                                       blurRadius: 3,
              //                                       color: Color(0x33000000),
              //                                       offset: Offset(0, 2),
              //                                     )
              //                                   ],
              //                                   borderRadius: BorderRadius.circular(8),
              //                                 ),
              //                                 child: Container(
              //                                   width: 100,
              //                                   height: 100,
              //                                   decoration: BoxDecoration(
              //                                     color: Color(0x65090F13),
              //                                     borderRadius: BorderRadius.circular(8),
              //                                   ),
              //                                   child: Padding(
              //                                     padding: EdgeInsetsDirectional.fromSTEB(
              //                                         0, 0, 0, 2),
              //                                     child: Column(
              //                                       mainAxisSize: MainAxisSize.max,
              //                                       children: [
              //                                         Padding(
              //                                           padding: EdgeInsetsDirectional.fromSTEB(
              //                                               16, 16, 16, 0),
              //                                           child: Row(
              //                                             mainAxisSize: MainAxisSize.max,
              //                                             children: [
              //                                               Expanded(
              //                                                 child: Text(
              //                                                   snapshot.data![index].Title,
              //                                                   style: TextStyle(
              //                                                     fontFamily: 'Lexend Deca',
              //                                                     color: Colors.white,
              //                                                     fontSize: 24,
              //                                                     fontWeight: FontWeight.bold,
              //                                                   ),
              //                                                 ),
              //                                               ),
              //                                               IconButton(onPressed: (){}, icon: Icon(Icons.abc),)
              //                                             ],
              //                                           ),
              //                                         ),
              //                                         Padding(
              //                                           padding: EdgeInsetsDirectional.fromSTEB(
              //                                               16, 4, 16, 0),
              //                                           child: Row(
              //                                             mainAxisSize: MainAxisSize.max,
              //                                             children: [
              //                                               Expanded(
              //                                                 child: Text(
              //                                                   snapshot.data![index].details,
              //                                                   style: TextStyle(
              //                                                     fontFamily: 'Lexend Deca',
              //                                                     color: Colors.white,
              //                                                     fontSize: 14,
              //                                                     fontWeight: FontWeight.normal,
              //                                                   ),
              //                                                 ),
              //                                               ),
              //                                             ],
              //                                           ),
              //                                         ),
              //                                         Expanded(
              //                                           child: Padding(
              //                                             padding:
              //                                                 EdgeInsetsDirectional.fromSTEB(
              //                                                     16, 4, 16, 16),
              //                                             child: Row(
              //                                               mainAxisSize: MainAxisSize.max,
              //                                               crossAxisAlignment:
              //                                                   CrossAxisAlignment.end,
              //                                               children: [
              //                                                 ElevatedButton.icon(
              //                                                   style: ElevatedButton.styleFrom(
              //                                                     primary: Color(0xFF4B39EF),
              //                                                     onPrimary: Colors.black,
              //                                                     shape: RoundedRectangleBorder(
              //                                                       borderRadius:
              //                                                           BorderRadius.circular(
              //                                                               8),
              //                                                     ),
              //                                                   ),
              //                                                   onPressed: () {
              //                                                     launch(snapshot.data![index].url);
              //                                                   },
              //                                                   label: Text('Reserve',style: TextStyle(color: Colors.white),),
              //                                                   icon: Icon(
              //                                                     Icons.add_rounded,
              //                                                     color: Colors.white,
              //                                                     size: 15,
              //                                                   ),
              //                                                 ),
              //                                                 Expanded(
              //                                                   child: Column(
              //                                                     mainAxisSize:
              //                                                         MainAxisSize.max,
              //                                                     mainAxisAlignment:
              //                                                         MainAxisAlignment.end,
              //                                                     crossAxisAlignment:
              //                                                         CrossAxisAlignment.end,
              //                                                     children: [
              //                                                       Padding(
              //                                                         padding:
              //                                                             EdgeInsetsDirectional
              //                                                                 .fromSTEB(
              //                                                                     0, 0, 0, 4),
              //                                                         child: Text(
              //                                                           '10:00am',
              //                                                           style: TextStyle(
              //                                                             fontFamily:
              //                                                                 'Lexend Deca',
              //                                                             color: Colors.white,
              //                                                             fontSize: 20,
              //                                                             fontWeight:
              //                                                                 FontWeight.bold,
              //                                                           ),
              //                                                         ),
              //                                                       ),
              //                                                       Text(
              //                                                         'Thursday June 22',
              //                                                         textAlign: TextAlign.end,
              //                                                         style: TextStyle(
              //                                                           fontFamily:
              //                                                               'Lexend Deca',
              //                                                           color:
              //                                                               Color(0xB4FFFFFF),
              //                                                           fontSize: 14,
              //                                                           fontWeight:
              //                                                               FontWeight.normal,
              //                                                         ),
              //                                                       ),
              //                                                     ],
              //                                                   ),
              //                                                 ),
              //                                               ],
              //                                             ),
              //                                           ),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           );
              //                 },
              //               ),
                
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
