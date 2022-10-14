import 'package:app/models/events.dart';
import 'package:app/models/messmeals.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../models/canteenmeals.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class canteenScreen extends StatefulWidget {
  @override
  State<canteenScreen> createState() => _canteenScreenState();
}

Future<List<CanteenMealType>> CanteenMenu() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/vipul-bhatia/nmimsdata/master/datafiles/canteenmenu.json'));

  List<CanteenMealType> mealtypes = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<CanteenItem> canteenitems = [];

    //Bhel/Chats
    List<dynamic> items = jsonResponse['Bhel/Chats'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/02/72/83/70/1000_F_272837036_IvX8YZgMaUkzS0qeNY3WcM97RstiFRCO.jpg',
        title: "Bhel/Chats",
        items: canteenitems));

    //Chinese Food
    canteenitems = [];
    items = jsonResponse['Chinese Food'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://images.hindustantimes.com/img/2021/08/22/1600x900/34962ab0-0111-11ec-8bb0-cae8e339dabd_1629601458570.jpg',
        title: "Chinese Food",
        items: canteenitems));

//Fast Food
    canteenitems = [];
    items = jsonResponse['Fast Food'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo-_G8kQT_k7IgosQf8zlf7FdJzZTH8kzt3Q&usqp=CAU',
        title: "Fast Food",
        items: canteenitems));

//Frankie
    canteenitems = [];
    items = jsonResponse['Frankie'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://cafeuppercrust.com/wp-content/uploads/2021/02/frankie_orig.jpg',
        title: "Frankie",
        items: canteenitems));

    //Fresh Juice
    canteenitems = [];
    items = jsonResponse['Fresh Juice'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://images.healthshots.com/healthshots/en/uploads/2022/02/08134710/JUICES.jpg',
        title: "Fresh Juice",
        items: canteenitems));

    //Grilled
    canteenitems = [];
    items = jsonResponse['Grilled'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://www.vegrecipesofindia.com/wp-content/uploads/2018/12/veg-grilled-sandwich-1.jpg',
        title: "Grilled",
        items: canteenitems));

    //Hot Beverages
    canteenitems = [];
    items = jsonResponse['Hot Beverages'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://foodrevolution.org/wp-content/uploads/iStock-1137365972-1.jpg',
        title: "Hot Beverages",
        items: canteenitems));

//Lunch
    canteenitems = [];
    items = jsonResponse['Lunch'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl: 'https://static.toiimg.com/photo/90934370.cms',
        title: "Lunch",
        items: canteenitems));

//Majedar Lassi
    canteenitems = [];
    items = jsonResponse['Majedar Lassi'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://zaykarecipes.com/wp-content/uploads/2017/02/lassi-recipe.jpg',
        title: "Mazedar Lassi",
        items: canteenitems));

    //Milk Shakes
    canteenitems = [];
    items = jsonResponse['Milk Shakes'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/190523-vanilla-milkshake-015-horizontal-1559169412.png',
        title: "Milk Shakes",
        items: canteenitems));

    //Pizza
    canteenitems = [];
    items = jsonResponse['Pizza'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://static.toiimg.com/photo/msid-87930581/87930581.jpg?211826',
        title: "Pizza",
        items: canteenitems));

    //Starter Chinese
    canteenitems = [];
    items = jsonResponse['Starter Chinese'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(
        imageUrl:
            'https://images.hindustantimes.com/img/2021/08/22/1600x900/34962ab0-0111-11ec-8bb0-cae8e339dabd_1629601458570.jpg',
        title: "Starter Chinese",
        items: canteenitems));

    return mealtypes;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Center(child: LottieBuilder.asset('Assets/no-internet.json'));
  }
}

class _canteenScreenState extends State<canteenScreen> {
  late Future<List<CanteenMealType>> futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = CanteenMenu();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CanteenMealType>>(
      future: futureMenu,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
              backgroundColor: Colors.white,
              title: Text(
                'Canteen',
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
            body: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index0) => SafeArea(
                      child: GestureDetector(
                    onTap: () {},
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x230F1113),
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  snapshot.data![index0].imageUrl,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                            theme: ExpandableThemeData(
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              tapBodyToCollapse: true,
                                            ),
                                            header: Text(
                                              snapshot.data![index0].title,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            collapsed: Text(''),
                                            expanded: Expanded(
                                              child: SizedBox(
                                                height: 700,
                                                child: ListView.builder(
                                                  itemCount: snapshot
                                                      .data![index0]
                                                      .items
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          ListTile(
                                                    title: Text(snapshot
                                                        .data![index0]
                                                        .items[index]
                                                        .name),
                                                    trailing: Text(snapshot
                                                        .data![index0]
                                                        .items[index]
                                                        .cost),
                                                  ),
                                                ),
                                              ),
                                            )
                                            // expanded: Row(
                                            //   children: [
                                            //     Text(
                                            //       snapshot.data![index].items
                                            //           .map((e) => e.name)
                                            //           .join('\n'),
                                            //       style: TextStyle(fontSize: 15),
                                            //     ),
                                            //     Padding(padding: EdgeInsets.only(left: 20)),
                                            //     Text(
                                            //       snapshot.data![index].items
                                            //           .map((e) => e.cost)
                                            //           .join('\n'),
                                            //       style: TextStyle(fontSize: 15),
                                            //     ),
                                            //   ],
                                            // ),
                                            )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ))),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: LottieBuilder.asset('Assets/no-internet.json'));
        }
        // By default, show a loading spinner.
        return Center(
          child: LoadingAnimationWidget.threeRotatingDots(
              color: Color(0xFF4B39EF), size: 50),
        );
      },
    );
  }
}

//Future openDialog() => showDialog(
//context: context,
//builder: (context)=>  AlertDialog(
//title: Text('Comming Soon'),
//));
