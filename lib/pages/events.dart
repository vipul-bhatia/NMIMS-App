import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/events.dart';
import 'package:url_launcher/url_launcher.dart';

Future<List<eventDetail>> eventsDetails() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/events.json'));

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
    throw Exception('Failed to load album');
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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Events'),
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
                  return InkWell(
                    highlightColor: Colors.blueAccent,
                    splashColor: Colors.blueAccent,
                    onTap: () => launch(snapshot.data![index].url),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  snapshot.data![index].ImageUrl,
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 10,
                                child: Container(
                                  width: 300,
                                  color: Colors.black54,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    snapshot.data![index].Title,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: ListTile(
                              title: Text(
                                snapshot.data![index].details,
                                style: TextStyle(fontSize: 23),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    launch(snapshot.data![index].url);
                                  },
                                  icon: Icon(Icons.launch)),
                            ),
                          )
                        ],
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
