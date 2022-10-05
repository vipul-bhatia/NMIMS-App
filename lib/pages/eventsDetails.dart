import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/events.dart';

class EventdetailsWidget extends StatefulWidget {
  const EventdetailsWidget({Key? key}) : super(key: key);
  static const routeName = '/event-details';

  @override
  _EventdetailsWidgetState createState() => _EventdetailsWidgetState();
}

class _EventdetailsWidgetState extends State<EventdetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ed = ModalRoute.of(context)!.settings.arguments as eventDetail;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF0F1113),
            size: 32,
          ),
        ),
        title: Text(
          ed.Title,
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Color(0xFF0F1113),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  ed.ImageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      ed.Title,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFF0F1113),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      '10:00am',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFF4B39EF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'The best of all 3 worlds, Row & Flow offers high intensity rowing and strength intervals followed by athletic based yoga sure to enhance flexible and clear the mind. Yoga mats are provided but bringing your own yoga mat is highly encouraged.',
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      ed.details,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFF4B39EF),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4B39EF),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(100, 40),
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                ),
                onPressed: () {
                  print('ButtonPrimary pressed ...');
                },
                label: Text('Reserve Spot'),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
