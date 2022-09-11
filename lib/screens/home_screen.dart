
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
        actions: [
//Emergency call button
          TextButton(
            onPressed: () {
              launch("tel: +919820000000");
            },
            child: Text(
              'Emergency',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
        title: Text(_widgetOptions[_selectedIndex]['title']),
      ),
      drawer: Drawer(
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.food_bank_outlined),
              title: Text('Canteen'),
              onTap: () {
                canteenScreen(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library_outlined),
              title: Text('Gallery'),
              onTap: () {
                galleryScreen(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.celebration),
              title: Text('Events'),
              onTap: () {
                eventsScreen(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Theatre'),
              onTap: () {
                theatreScreen(context);
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("OFFICE",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.person_outlined),
              title: Text('Contacts'),
              onTap: (() => contactsScreen(context)),
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Links'),
              onTap: (() => linksScreen(context)),
            ),
            ListTile(
              leading: Icon(Icons.document_scanner_outlined),
              title: Text('Documents Required'),
              onTap: (() => documentsScreen(context)),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Faculty'),
              onTap: (() => facultyScreen(context)),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("OTHER",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('News'),
              onTap: (() => newsScreen(context)),
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text('Feedback'),
              onTap: (() => feedbackScreen(context)),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('About Us'),
              onTap: (() => aboutScreen(context)),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_outlined),
              title: Text('Exit'),
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
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Campus',
                ),
                GButton(
                  icon: Icons.book_outlined,
                  text: 'Academics',
                ),
                GButton(
                  icon: Icons.bed_outlined,
                  text: 'Hostel',
                ),
                GButton(
                  icon: Icons.food_bank_outlined,
                  text: 'Mess Menu',
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
