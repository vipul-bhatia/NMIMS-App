import 'package:app/models/faculty.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/faculty.dart';

class facultyDetailsScreen extends StatelessWidget {
  static const routeName = '/faculty-details';

  @override
  Widget build(BuildContext context) {
    final fd = ModalRoute.of(context)!.settings.arguments as Faculties;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
  backgroundColor: Colors.white,
  title: Text(
 fd.name,
    style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
  ),
  actions: [],

  elevation: 0,
),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(
                      fd.profile_img,
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 280 - 144 / 2,
                  child: CircleAvatar(
                    radius: 144 / 2,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: NetworkImage(fd.img_url),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              fd.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              fd.department,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              fd.sitting_position,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Color(0xFF4B39EF),
                    child: InkWell(
                        onTap: () => launch(fd.linkedin),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.linkedin,
                            size: 32,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 30,
                  child: Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Color(0xFF4B39EF),
                    child: InkWell(
                        onTap: () => launch('mailto: fd.email'),
                        child: Center(
                          child: Icon(
                            Icons.email,
                            size: 32,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
               
             CircleAvatar(
                  radius: 30,
                  child: Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Color(0xFF4B39EF),
                    child: InkWell(
                        onTap: () => launch(fd.website),
                        child: Center(
                          child: Icon(
                            Icons.link,
                            size: 32,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    fd.about,
                    style: TextStyle(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
