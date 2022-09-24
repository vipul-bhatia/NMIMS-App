import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:convert';
import '../models/messmeals.dart';

Future<List<MealType>> fatchMenu() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/messmenu.json'));

  List<MealType> mealtypes = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);
    List<Meals> meals = [];

    //Brealfast
    List<dynamic> items = jsonResponse['breakfast'];
    items.forEach((element) {
      String mealtype = element['mealtype'];
      String meal = element['meal'];
      meals.add(Meals(title: mealtype, Description: meal));
    });
    mealtypes.add(MealType(mealtype: "breakfast", meals: meals));

    //Lunch
    meals = [];
    items = jsonResponse['lunch'];
    items.forEach((element) {
      String mealtype = element['mealtype'];
      String meal = element['meal'];
      meals.add(Meals(title: mealtype, Description: meal));
    });
    mealtypes.add(MealType(mealtype: "lunch", meals: meals));

    //Dinner
    meals = [];
    items = jsonResponse['dinner'];
    items.forEach((element) {
      String mealtype = element['mealtype'];
      String meal = element['meal'];
      meals.add(Meals(title: mealtype, Description: meal));
    });
    mealtypes.add(MealType(mealtype: "dinner", meals: meals));

    return mealtypes;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw  Center(
            child: Image.asset("Assets/nointernet.jpg")
          );
  }
}

class messScreen extends StatefulWidget {
  @override
  State<messScreen> createState() => _messScreenState();
}

class _messScreenState extends State<messScreen> {
  late Future<List<MealType>> futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = fatchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: FutureBuilder<List<MealType>>(
          future: futureMenu,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(20),
                    child: TabBar(padding: EdgeInsets.all(0),
                        //isScrollable: true,
                        tabs: [
                          Tab(
                              icon: Icon(Icons.breakfast_dining),
                              text: 'Breakfast'),
                          Tab(icon: Icon(Icons.lunch_dining), text: 'Lunch'),
                          Tab(icon: Icon(Icons.dinner_dining), text: 'Dinner'),
                        ]),
                  ),
                ),
                body: TabBarView(
                  children: [
                    RefreshIndicator(
                      onRefresh: () => fatchMenu(),
                      child: ListView.builder(
                        itemCount: snapshot.data![0].meals.length,
                        itemBuilder: (ctx, index) => Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Material(
                              elevation: 20.0,
                              shadowColor: Colors.blue,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                child: ListTile(
                                  title: Text(snapshot.data![0].meals[index].title),
                                  subtitle: Text(
                                      snapshot.data![0].meals[index].Description),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () => fatchMenu(),
                      child: ListView.builder(
                        itemCount: snapshot.data![1].meals.length,
                        itemBuilder: (ctx, index) => Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Material(
                              elevation: 20.0,
                              shadowColor: Colors.blue,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                child: ListTile(
                                  title: Text(snapshot.data![1].meals[index].title),
                                  subtitle: Text(
                                      snapshot.data![1].meals[index].Description),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () => fatchMenu(),
                      child: ListView.builder(
                        itemCount: snapshot.data![2].meals.length,
                        itemBuilder: (ctx, index) => Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Material(
                              elevation: 20.0,
                              shadowColor: Colors.blue,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                child: ListTile(
                                  title: Text(snapshot.data![2].meals[index].title),
                                  subtitle: Text(
                                      snapshot.data![2].meals[index].Description),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return  Center(
            child: Image.asset("Assets/nointernet.jpg")
          );
            }
            // By default, show a loading spinner.
            return LoadingAnimationWidget.threeRotatingDots(color: Colors.white, size: 50);
          }),
    );
  }
}
