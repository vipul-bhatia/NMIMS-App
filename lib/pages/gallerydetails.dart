import 'dart:io';

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../models/gallery.dart';

class galleryDetailsScreen extends StatefulWidget {
  static const routeName = '/gallery-details';

  @override
  State<galleryDetailsScreen> createState() => _galleryDetailsScreenState();
}

class _galleryDetailsScreenState extends State<galleryDetailsScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gd = ModalRoute.of(context)!.settings.arguments as galleryData;

    return Scaffold(
      appBar:AppBar(
         iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
  backgroundColor: Colors.white,
  title: Text(
    'Gallery',
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
      body: Container(
        child: Column(
          children: [
            Image.network(
              gd.ImageUrl,
              height: 450,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 40,
            ),
            Material(
              elevation: 20.0,
              shadowColor: Color(0xFF4B39EF),
              child: Text(
                gd.Title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      //Init Floating Action Bubble
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "Save in Gallery",
            iconColor: Colors.white,
            bubbleColor: Color(0xFF4B39EF),
            icon: Icons.save,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: (() async {
              final urlImage = gd.ImageUrl;
              await GallerySaver.saveImage(urlImage,toDcim: true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Image Saved in Gallery'),
                  duration: Duration(seconds: 2),
                ),
              );
              _animationController.reverse();
            }),
          ),
          // Floating action menu item
          Bubble(
            title: "Show in Google",
            iconColor: Colors.white,
            bubbleColor: Color(0xFF4B39EF),
            icon: Icons.search,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: (() async {
              await launch(gd.ImageUrl);
            }),
          ),
          //Floating action menu item
          Bubble(
            title: "Share",
            iconColor: Colors.white,
            bubbleColor: Color(0xFF4B39EF),
            icon: Icons.share,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: (() async {
              final urlImage = gd.ImageUrl;
              final url = Uri.parse(urlImage);
              final response = await http.get(url);
              final bytes = response.bodyBytes;

              final temp = await getTemporaryDirectory();
              final path = '${temp.path}/image.jpg';
              File(path).writeAsBytesSync(bytes);
              // Directory tempDir = await getTemporaryDirectory();
              // String tempPath = tempDir.path;
              // File file = new File('$tempPath/image.jpg');

              await Share.shareFiles(
                [path],
                text: 'Share Image',
              );
            }),
          ),
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        // Floating Action button Icon color
        iconColor: Colors.white,

        // Flaoting Action button Icon
        iconData: Icons.ac_unit,
        backGroundColor: Color(0xFF4B39EF),
      ),
    );
  }
}
