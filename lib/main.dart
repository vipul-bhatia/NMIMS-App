import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import '../pages/contacts.dart';
import '../pages/links.dart';
import '../pages/documentation.dart';
import '../pages/feedback.dart';
import '../pages/gallery.dart';
import '../pages/about.dart';
import '../pages/canteen.dart';
import '../pages/generalStore.dart';
import '../pages/academics.dart';
import '../pages/hostel.dart';
import '../pages/mess.dart';
import '../pages/campus.dart';
import '../pages/events.dart';
import '../pages/faculty.dart';
import 'pages/news.dart';
import '../pages/academicsImformation.dart';
import '../pages/splashPage.dart';
import '../pages/theatre.dart';
import '../pages/facultyDetails.dart';
import '../pages/gallerydetails.dart';
import '../pages/eventsDetails.dart';
import 'pages/onboardingnew.dart';
import '../pages/academicsImformation.dart';
import '../pages/academics.dart';



void main() => runApp( MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'NMIMS Shirpur',
      debugShowCheckedModeBanner: false,
  
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreenWidget(),
        '/home': (context) => HomeScreen(),
        '/contacts': (context) =>  ContactScreen(),
        '/links': (context) =>  linksScreen(),
        '/documents':(context) => documentScreen(),
        '/feedback': (context) => feedbackScreen(title: 'Feedback'),
        '/gallery':(context) => galleryScreen(),
        '/about': (context) => aboutScreen(),
        '/canteen':(context) => canteenScreen(),
        '/generalStore':(context) => generalStoreScreen(),
        '/academics':(context) => academicsScreen(),
        '/hostel':(context) => hostelScreen(),
        '/mess':(context) => messScreen(),
        '/campus':(context) => CampusScreen(),
        '/events':(context) => eventsScreen(),
        '/faculty':(context) => facultyScreen(),
        '/news':(context) => newsHome(),
        '/theatre':(context) => theatreScreen(),
      academicsDetailScreen.routeName: (context) => academicsDetailScreen(),
          facultyDetailsScreen.routeName: (ctx) => facultyDetailsScreen(),
          galleryDetailsScreen.routeName: (ctx) => galleryDetailsScreen(),
          EventdetailsWidget.routeName: (ctx) => EventdetailsWidget(),
      },
    );
  }
}
