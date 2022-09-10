import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/faculty.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/facultyDetails.dart';

Future<List<facultyDetail>> facultyDetails() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/faculty/main/faculty%20screen'));

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
      String id = element['id'];
      String ImageUrl = element['ImageUrl'];
      String number = element['number'];
      facultydetails.add(facultyDetail(
          Title: Title,
          details: details,
          id: id,
          ImageUrl: ImageUrl,
          number: number));
    });
    return facultydetails;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
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
    print(fd.id);
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
      appBar: AppBar(
        title: Text('Faculty'),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20.0,
                      shadowColor: Colors.blue,
                      child: ListTile(
                        onTap:  () => selectFaculty(context, snapshot.data![index]),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].ImageUrl.toString()),
                        ),
                        title: Text(snapshot.data![index].Title),
                        subtitle: Text(snapshot.data![index].details),
                        trailing: IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            launch("tel:${snapshot.data![index].number}");
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
