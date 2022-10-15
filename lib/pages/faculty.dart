import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:mdi/mdi.dart';
import 'dart:convert';
import '../models/faculty.dart';

Future<List<FacultyPlace>> fatchMenu() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/VCCASH/cc-data/dev/data/faculties.json'));

  List<FacultyPlace> FacultyPlaces = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<Faculties> faculties = [];

    //A Wing
    List<dynamic> items = jsonResponse['A Wing'];
    items.forEach((element) {
      String profile_img = element['profile_img'];
      String img_url = element['img_url'];
      String name = element['name'];
      String department = element['department'];
      String sitting_position = element['sitting_position'];
      String email = element['email'];
      String linkedin = element['linkedin'];
      String website = element['website'];
      String about = element['about'];
      faculties.add(Faculties(
        profile_img: profile_img,
          img_url: img_url,
          name: name,
          department: department,
          sitting_position: sitting_position,
          email: email,
          linkedin: linkedin,
          website: website,
          about: about));
    });
    FacultyPlaces.add(FacultyPlace(faculties: faculties, place: 'A Wing'));

    //B Wing
    faculties = [];
    items = jsonResponse['B Wing'];
    items.forEach((element) {
       String profile_img = element['profile_img'];
      String img_url = element['img_url'];
      String name = element['name'];
      String department = element['department'];
      String sitting_position = element['sitting_position'];
      String email = element['email'];
      String linkedin = element['linkedin'];
      String website = element['website'];
      String about = element['about'];
      faculties.add(Faculties(
        profile_img: profile_img,
          img_url: img_url,
          name: name,
          department: department,
          sitting_position: sitting_position,
          email: email,
          linkedin: linkedin,
          website: website,
          about: about));
    });
    FacultyPlaces.add(FacultyPlace(faculties: faculties, place: 'B Wing'));

    //C Wing
    faculties = [];
    items = jsonResponse['C Wing'];
    items.forEach((element) {
       String profile_img = element['profile_img'];
      String img_url = element['img_url'];
      String name = element['name'];
      String department = element['department'];
      String sitting_position = element['sitting_position'];
      String email = element['email'];
      String linkedin = element['linkedin'];
      String website = element['website'];
      String about = element['about'];
      faculties.add(Faculties(
        profile_img: profile_img,
          img_url: img_url,
          name: name,
          department: department,
          sitting_position: sitting_position,
          email: email,
          linkedin: linkedin,
          website: website,
          about: about));
    });
    FacultyPlaces.add(FacultyPlace(faculties: faculties, place: 'C Wing'));

//D Wing
    faculties = [];
    items = jsonResponse['D Wing'];
    items.forEach((element) {
      String profile_img = element['profile_img'];
      String img_url = element['img_url'];
      String name = element['name'];
      String department = element['department'];
      String sitting_position = element['sitting_position'];
      String email = element['email'];
      String linkedin = element['linkedin'];
      String website = element['website'];
      String about = element['about'];
      faculties.add(Faculties(
        profile_img: profile_img,
          img_url: img_url,
          name: name,
          department: department,
          sitting_position: sitting_position,
          email: email,
          linkedin: linkedin,
          website: website,
          about: about));
    });
    FacultyPlaces.add(FacultyPlace(faculties: faculties, place: 'D Wing'));
    return FacultyPlaces;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Center(child: LottieBuilder.asset('Assets/no-internet.json'));
  }
}

class facultyScreen extends StatefulWidget {
  @override
  State<facultyScreen> createState() => _facultyScreenState();
}

class _facultyScreenState extends State<facultyScreen> {
  late Future<List<FacultyPlace>> futureMenu;

  void selectFaculty(BuildContext ctx, Faculties fd) {
    Navigator.of(ctx).pushNamed(
      '/faculty-details',
      arguments: fd,
    );
  }

  @override
  void initState() {
    super.initState();
    futureMenu = fatchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: FutureBuilder<List<FacultyPlace>>(
          future: futureMenu,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                     iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
                  title: Text("Faculty",style:  TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  bottom: TabBar(
                      padding: EdgeInsets.all(0),
                      //isScrollable: true,
                      tabs: [
                        Tab(
                            icon: Icon(
                              Mdi.alphaA,
                              size: 35,
                              color: Color(0xFF4B39EF),
                            ),
                            child: Text(
                              "Wing",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                        Tab(
                            icon: Icon(Mdi.alphaB,
                                size: 35, color: Color(0xFF4B39EF)),
                            child: Text(
                              "Wing",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                        Tab(
                            icon: Icon(Mdi.alphaC,
                                size: 35, color: Color(0xFF4B39EF)),
                            child: Text(
                              "Wing",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                        Tab(
                            icon: Icon(Mdi.alphaD,
                                size: 35, color: Color(0xFF4B39EF)),
                            child: Text(
                              "Wing",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                      ]),
                ),
                body: TabBarView(
                  children: [
                    RefreshIndicator(
                      onRefresh: () => futureMenu,
                      child: ListView.builder(
                        itemCount: snapshot.data![0].faculties.length,
                        itemBuilder: (context, index) {
                          return SafeArea(
                            child: GestureDetector(
                              onTap: () {
                                selectFaculty(context,
                                    snapshot.data![0].faculties[index]);
                              },
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 12),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              //cirecle avatar
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: NetworkImage(
                                                     snapshot.data![0].faculties[index].img_url),
                                                  radius: 45,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 4, 0, 4),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![0].faculties[index].name
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![0].faculties[index].department
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ?snapshot.data![0].faculties[index].sitting_position
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 16, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Icon(
                                                    Icons.access_time_rounded,
                                                    color: Color(0xFF4B39EF),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    '10:00AM-05:00PM | Mon-Sat',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF4B39EF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    selectFaculty(context,
                                    snapshot.data![0].faculties[index]);
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: Color(0xFF4B39EF),
                                                      size: 20),
                                                ),
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
                    ),
                    RefreshIndicator(
                      onRefresh: () => futureMenu,
                      child: ListView.builder(
                        itemCount: snapshot.data![1].faculties.length,
                        itemBuilder: (context, index2) {
                          return SafeArea(
                            child: GestureDetector(
                              onTap:  () {
                                selectFaculty(context, snapshot.data![1]
                                    .faculties[index2]);
                              },
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 12),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              //cirecle avatar
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: NetworkImage(
                                                   snapshot.data![1].faculties[index2].img_url),
                                                  radius: 45,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 4, 0, 4),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![1].faculties[index2].name
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![1].faculties[index2].department
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![1].faculties[index2].sitting_position
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 16, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Icon(
                                                    Icons.access_time_rounded,
                                                    color: Color(0xFF4B39EF),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    '10:00AM-05:00PM | Mon-Sat',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF4B39EF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    selectFaculty(
                                                        context,
                                                        snapshot.data![1]
                                                            .faculties[index2]);
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: Color(0xFF4B39EF),
                                                      size: 20),
                                                ),
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
                    ),
                    RefreshIndicator(
                      onRefresh: () => futureMenu,
                      child: ListView.builder(
                        itemCount: snapshot.data![2].faculties.length,
                        itemBuilder: (context, index3) {
                          return SafeArea(
                            child: GestureDetector(
                              onTap:  () {
                                selectFaculty(context, snapshot.data![2]
                                    .faculties[index3]);
                              },
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 12),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              //cirecle avatar
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: NetworkImage(
                                                   
                                                          snapshot.data![2].faculties[index3].img_url),
                                                  radius: 45,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 4, 0, 4),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![2].faculties[index3].name
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![2].faculties[index3].department
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![2].faculties[index3].sitting_position
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 16, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Icon(
                                                    Icons.access_time_rounded,
                                                    color: Color(0xFF4B39EF),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    '10:00AM-05:00PM | Mon-Sat',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF4B39EF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    selectFaculty(
                                                        context,
                                                        snapshot.data![2]
                                                            .faculties[index3]);
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: Color(0xFF4B39EF),
                                                      size: 20),
                                                ),
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
                    ),
                    RefreshIndicator(
                      onRefresh: () => futureMenu,
                      child: ListView.builder(
                        itemCount:snapshot.data![3].faculties.length,
                        itemBuilder: (context, index4) {
                          return SafeArea(
                            child: GestureDetector(
                              onTap:  () {
                                selectFaculty(context, snapshot.data![3]
                                    .faculties[index4]);
                              },
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 12),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              //cirecle avatar
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: NetworkImage(
                                                     snapshot.data![3].faculties[index4].img_url),
                                                  radius: 45,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 4, 0, 4),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![3].faculties[index4].name
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![3].faculties[index4].department
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          snapshot.hasData
                                                              ? snapshot.data![3].faculties[index4].sitting_position
                                                              : 'Loading...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 16, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Icon(
                                                    Icons.access_time_rounded,
                                                    color: Color(0xFF4B39EF),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    '10:00AM-05:00PM | Mon-Sat',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF4B39EF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    selectFaculty(
                                                        context,
                                                        snapshot.data![3]
                                                            .faculties[index4]);
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: Color(0xFF4B39EF),
                                                      size: 20),
                                                ),
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
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: LottieBuilder.asset('Assets/no-internet.json'));
            }
            // By default, show a loading spinner.
            return LoadingAnimationWidget.threeRotatingDots(
                color: Color(0xFF4B39EF), size: 50);
          }),
    );
  }
}





























// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import '../models/faculty.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../pages/facultyDetails.dart';

// Future<List<facultyDetail>> facultyDetails() async {
//   final response = await http.get(Uri.parse(
//       'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/faculties.json'));
//   String title = "Faculty";
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     var jsonResponse = jsonDecode(response.body);
//     List<facultyDetail> facultydetails = [];
//     List<dynamic> faculties = jsonResponse['Faculty'];
//     faculties.forEach((element) {
//       String Title = element['Title'];
//       String details = element['details'];
//       String ImageUrl = element['ImageUrl'];
//       String profileImage = element['profileImage'];
//       String number = element['number'];
//       String sittingP = element['sittingP'];
//       String linkedin = element['linkedin'];
//       String email = element['email'];
//       String twitter = element['twitter'];
//       String phone = element['phone'];
//       String about = element['about'];
//       String qualifications = element['qualifications'];
//       facultydetails.add(facultyDetail(
//           Title: Title,
//           details: details,
//           ImageUrl: ImageUrl,
//           profileImage: profileImage,
//           number: number,
//           sittingP: sittingP,
//           linkedin: linkedin,
//           email: email,
//           twitter: twitter,
//           phone: phone,
//           about: about,
//           qualifications: qualifications));
//     });
//     return facultydetails;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw  Center(
//             child: Image.asset("Assets/nointernet.jpg")
//           );
//   }
// }

// class facultyScreen extends StatefulWidget {
//   @override
//   State<facultyScreen> createState() => _facultyScreenState();
// }

// class _facultyScreenState extends State<facultyScreen> {
//   late Future<List<facultyDetail>> futureMenu;
//   @override
//   void initState() {
//     super.initState();
//     futureMenu = facultyDetails();
//   }








//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:  AppBar(
//   backgroundColor: Colors.white,
//   title: Text(
//     'Faculty',
//     style: TextStyle(
//           fontFamily: 'Lexend Deca',
//           color: Colors.black,
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//         ),
//   ),
//   actions: [],

//   elevation: 0,
// ),
//       body: FutureBuilder<List<facultyDetail>>(
//         future: futureMenu,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
            
     //     }
//           return Center(child: LoadingAnimationWidget.threeRotatingDots(color: Color(0xFF4B39EF), size: 50),);
//         },
//       ),
//     );
//   }
// }
