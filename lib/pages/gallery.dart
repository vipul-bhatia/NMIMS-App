import 'package:app/models/gallery.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../pages/gallerydetails.dart';

Future<List<galleryData>> galleryDatas() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/gallery.json'));
  String title = "Gallery";
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<galleryData> galleryDatas = [];
    List<dynamic> datas = jsonResponse['Gallery'];
    datas.forEach((element) {
      String Title = element['Title'];
      String ImageUrl = element['ImageUrl'];
      galleryDatas.add(galleryData(Title: Title, ImageUrl: ImageUrl));
    });
    return galleryDatas;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw  Center(
            child:LottieBuilder.asset('Assets/no-internet.json')
          );
  }
}

class galleryScreen extends StatefulWidget {
  @override
  State<galleryScreen> createState() => _galleryScreenState();
}

class _galleryScreenState extends State<galleryScreen> {
   void selectPhoto(BuildContext ctx, galleryData gd) {
    Navigator.of(ctx).pushNamed(
      galleryDetailsScreen.routeName,
      arguments: gd,
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
      body: FutureBuilder<List<galleryData>>(
        future: galleryDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<galleryData>? data = snapshot.data;
            return StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () => selectPhoto(context, data[index]),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        child: Image.network(
                          data[index].ImageUrl,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return  Center(
            child: LottieBuilder.asset('Assets/no-internet.json')
          );
          }

          // By default, show a loading spinner.
          return Center(child: LoadingAnimationWidget.threeRotatingDots(color: Color(0xFF4B39EF), size: 50),);
        },
      ),
    );
  }
}
