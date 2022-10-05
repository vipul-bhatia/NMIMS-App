import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../pages/academics.dart';
import '../pages/campus.dart';
import '../pages/mess.dart';
import '../pages/hostel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void contactsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/contacts');
  }

  void linksScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/links');
  }

  void documentsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/documents');
  }

  void feedbackScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/feedback');
  }

  void galleryScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/gallery');
  }

  void aboutScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/about');
  }

  void canteenScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/canteen');
  }

  void generalStoreScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/generalStore');
  }

  void eventsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/events');
  }

  void facultyScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/faculty');
  }

  void libraryScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/library');
  }

  void dressCodeScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/dressCode');
  }

  void newsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/news');
  }

  void theatreScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/theatre');
  }

  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _widgetOptions = [
    {'Pages': CampusScreen(), 'title': 'NMIMS Shirpur'},
    {'Pages': CategoriesScreen(), 'title': 'NMIMS Shirpur'},
    {'Pages': hostelScreen(), 'title': 'NMIMS Shirpur'},
    {'Pages': messScreen(), 'title': 'NMIMS Shirpur'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
        actions: [
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.warning),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Emergency'),
                        content: Text(
                            'Are you sur you want to call the emergency number for help ?'),
                            actions: [
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  launch("tel://+919820000000");
                                },
                              ),
                              TextButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                      ));
            },
          ),
        ],
//Emergency call button
        // TextButton(
        //   onPressed: () {
        //     //launch("tel: +919820000000");
        //     showDialog(context: context, builder: (context) => AlertDialog(
        //       title: Text('Emergency'),
        //       content: Text('Are you sure you want to call the emergency number for help?'),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //           child: Text('No'),
        //         ),
        //         TextButton(
        //           onPressed: () {
        //             launch("tel: +919820000000");
        //             Navigator.of(context).pop();
        //           },
        //           child: Text('Yes'),
        //         ),
        //       ],
        //     ));
        //   },
        //   child: Text(
        //     'Emergency',
        //     style: TextStyle(color: Colors.redAccent),
        //   ),
        // ),

        title: Text(
          _widgetOptions[_selectedIndex]['title'],
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        shadowColor: Color(0xFF4B39EF),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/campus-1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Explore',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("CAMPUS",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.food_bank_outlined, color: Color(0xFF4B39EF)),
              title: Text(
                'Canteen',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                canteenScreen(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library_outlined,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Gallery',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                galleryScreen(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.celebration,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Events',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                eventsScreen(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.movie,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Theatre',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                theatreScreen(context);
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("OFFICE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outlined,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Contacts',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: (() => contactsScreen(context)),
            ),
             ListTile(
              leading: Icon(
                Icons.newspaper,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'News',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: (() => newsScreen(context)),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.link,
            //     color: Color(0xFF4B39EF),
            //   ),
            //   title: Text(
            //     'Links',
            //     style:
            //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //   ),
            //   onTap: (() => linksScreen(context)),
            // ),
            ListTile(
              leading: Icon(
                Icons.work,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Faculty',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: (() => facultyScreen(context)),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("OTHER",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.newspaper,
            //     color: Color(0xFF4B39EF),
            //   ),
            //   title: Text(
            //     'News',
            //     style:
            //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //   ),
            //   onTap: (() => newsScreen(context)),
            // ),
            ListTile(
              leading: Icon(
                Icons.feedback_outlined,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Feedback',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: (() => feedbackScreen(context)),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'About Us',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: (() => aboutScreen(context)),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Exit',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            Text(
              "from",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "cmulay",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex]['Pages'],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color(0xFF4B39EF),
              hoverColor: Color(0xFF4B39EF),
              gap: 8,
              activeColor: Color(0xFF4B39EF),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_outlined ,iconColor: Colors.black,
                  text: 'Campus',textColor: Colors.black,
                ),
                GButton(
                  icon: Icons.book_outlined,iconColor: Colors.black,
                  text: 'Academics',textColor: Colors.black,
                ),
                GButton(
                  icon: Icons.bed_outlined,iconColor: Colors.black,
                  text: 'Hostel',textColor: Colors.black,
                ),
                GButton(
                  icon: Icons.food_bank_outlined,iconColor: Colors.black,
                  text: 'Mess Menu',textColor: Colors.black,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
