import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../models/gallery.dart';

class galleryDetailsScreen extends StatelessWidget {
  static const routeName = '/gallery-details';
  @override
  Widget build(BuildContext context) {
    final gd = ModalRoute.of(context)!.settings.arguments as galleryData;
    return Scaffold(
      appBar: AppBar(
        title: Text(gd.Title),
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
                      gd.ImageUrl,
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              elevation: 20.0,
              shadowColor: Colors.blue,
              child: Text(
                gd.Title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: (() async {
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

                  await Share.shareFiles([path],
                      text: 'Share Image',);
                }),
                child: Text('Share Image')),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: (() async {
                  await launch(gd.ImageUrl);
                }),
                child: Text('Show Image in Chrome')),
          ],
        ),
      ),
    );
  }
}
