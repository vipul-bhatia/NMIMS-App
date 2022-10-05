import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/faculty.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/facultyDetails.dart';

Future<List<facultyDetail>> facultyDetails() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/faculties.json'));
  String title = "Faculty";
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<facultyDetail> facultydetails = [];
    List<dynamic> faculties = jsonResponse['Faculty'];
    faculties.forEach((element) {
      String Title = element['Title'];
      String details = element['details'];
      String ImageUrl = element['ImageUrl'];
      String profileImage = element['profileImage'];
      String number = element['number'];
      String sittingP = element['sittingP'];
      String linkedin = element['linkedin'];
      String email = element['email'];
      String twitter = element['twitter'];
      String phone = element['phone'];
      String about = element['about'];
      String qualifications = element['qualifications'];
      facultydetails.add(facultyDetail(
          Title: Title,
          details: details,
          ImageUrl: ImageUrl,
          profileImage: profileImage,
          number: number,
          sittingP: sittingP,
          linkedin: linkedin,
          email: email,
          twitter: twitter,
          phone: phone,
          about: about,
          qualifications: qualifications));
    });
    return facultydetails;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw  Center(
            child: Image.asset("Assets/nointernet.jpg")
          );
  }
}

class facultyScreen extends StatefulWidget {
  @override
  State<facultyScreen> createState() => _facultyScreenState();
}

class _facultyScreenState extends State<facultyScreen> {
  late Future<List<facultyDetail>> futureMenu;
  @override
  void initState() {
    super.initState();
    futureMenu = facultyDetails();
  }


 void selectFaculty(BuildContext ctx, facultyDetail fd) {
    Navigator.of(ctx).pushNamed(
      facultyDetailsScreen.routeName,
      arguments: fd,
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
      appBar:  AppBar(
  backgroundColor: Colors.white,
  title: Text(
    'Faculty',
    style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
  ),
  actions: [],

  elevation: 0,
),
      body: FutureBuilder<List<facultyDetail>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () => futureMenu,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SafeArea(
        child: GestureDetector(
          onTap:() => selectFaculty(context, snapshot.data![index]),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x2B202529),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 0, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                        snapshot.hasData
                                          ? snapshot.data![index].Title
                                          : 'Loading...',
                                      style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF101213),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                     ('Assistant Proffesor'),
                                      style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF101213),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      snapshot.hasData
                                          ? snapshot.data![index].sittingP
                                          : 'Loading...',
                                      style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(12),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.network(
                              snapshot.data![index].profileImage,
                              //'https://platform.cstatic-images.com/large/in/v2/stock_photos/af7f32d6-41d2-4a67-bd6e-49e188d0a7fb/3de60623-b1df-44e7-9da6-53129a69039c.png',
                              width: 160,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF1F4F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Icon(
                                Icons.access_time_rounded,
                                color: Color(0xFF4B39EF),
                                size: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                '10am-5pm',
                                style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                           Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: IconButton(
                              onPressed: () => selectFaculty(context, snapshot.data![index]),
                              icon: Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xFF4B39EF), size: 20),),
                          ),
                        ],
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
          }
          return Center(child: LoadingAnimationWidget.threeRotatingDots(color: Color(0xFF4B39EF), size: 50),);
        },
      ),
    );
  }
}
