import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:mdi/mdi.dart';
import '../pages/academics.dart';
import '../pages/campus.dart';
import '../pages/mess.dart';
import '../pages/hostel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/events.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../pages/gallery.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  CountDownController _controller = CountDownController();
  late final AnimationController _cantroller;
  void initState(){
    super.initState();
    _cantroller = AnimationController(vsync: this);
  }
  void dispose(){
    _cantroller.dispose();
    super.dispose();
  }
  bool _isPlaying = false;
  bool _isPause = false;
  void contactsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/contacts');
  }

  void linksScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/links');
  }

  void hostelScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/hostel');
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
    {'Pages': academicsScreen(), 'title': 'NMIMS Shirpur'},
    {'Pages': eventsScreen(), 'title': 'NMIMS Shirpur'},
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
            icon: Icon(Icons.sos_rounded),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Emergency'),
                        content: Text(
                            'Are you sure you want to call the emergency number for help ?'),
                        actions: [
                          Center(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color(
                                      0xFF4B39EF,
                                    )),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.fromLTRB(30, 5, 30, 5)),
                                  ),
                                  child: Text(
                                    'Boys',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    launch("tel://+919820000000");
                                  },
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color(
                                      0xFF4B39EF,
                                    )),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.fromLTRB(30, 5, 30, 5)),
                                  ),
                                  child: Text('Girls',
                                      style: TextStyle(fontSize: 20)),
                                  onPressed: (){
                                    launch("tel://+919820000000");
                                  },
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color(
                                      0xFF4B39EF,
                                    )),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.fromLTRB(40, 5, 40, 5)),
                                  ),
                                  child: Text('No',
                                      style: TextStyle(fontSize: 20)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          )
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
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        shadowColor: Color(0xFF4B39EF),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                //gallery
                galleryScreen(context);
              },
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/campus-1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Explore ->',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
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
            // ListTile(
            //   leading: Icon(
            //     Icons.photo_library_outlined,
            //     color: Color(0xFF4B39EF),
            //   ),
            //   title: Text(
            //     'Gallery',
            //     style:
            //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //   ),
            //   onTap: () {
            //     galleryScreen(context);
            //   },
            // ),

            // ListTile(
            //   leading: Icon(
            //     Icons.movie,
            //     color: Color(0xFF4B39EF),
            //   ),
            //   title: Text(
            //     'Theatre',
            //     style:
            //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //   ),
            //   onTap: () {
            //     theatreScreen(context);
            //   },
            // ),
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
                Icons.bed,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Hostel',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                hostelScreen(context);
              },
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
              onTap:(){Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_fJ7CVd.json');
                },
              // onTap: (() => aboutScreen(context)),
            ),
            ListTile(
              leading: Icon(
                Mdi.heart,
                color: Color(0xFF4B39EF),
              ),
              title: Text(
                'Made With Dot.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_fJ7CVd.json')));
              },
            ),
            Divider(),
           //on tap on which animation happens
            // GestureDetector(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Lottie.network(
            //           'https://assets10.lottiefiles.com/packages/lf20_fJ7CVd.json')));
            //   },
            //   child: Center(
            //     child: Text(
            //       'Made with ❤️ by Team 1',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 12,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(10),
            //   child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_fJ7CVd.json')
            // ),
            // GestureDetector(
              
            //     onTap: () {
            //       Lottie.network(
            //           'https://assets10.lottiefiles.com/packages/lf20_fJ7CVd.json');
            //     },
            //     child: Center(
            //         child: Text(
            //       'Made with Dot.',
            //       style: TextStyle(fontSize: 20),
            //     ))),
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
              gap: 8,
              activeColor: Color(0xFF4B39EF),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  iconColor: Colors.black,
                  text: 'Campus',
                  textColor: Colors.black,
                ),
                GButton(
                  icon: Icons.book_outlined,
                  iconColor: Colors.black,
                  text: 'Academics',
                  textColor: Colors.black,
                ),
                GButton(
                  icon: Icons.event,
                  iconColor: Colors.black,
                  text: 'Events',
                  textColor: Colors.black,
                ),
                GButton(
                  icon: Icons.food_bank_outlined,
                  iconColor: Colors.black,
                  text: 'Mess Menu',
                  textColor: Colors.black,
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
