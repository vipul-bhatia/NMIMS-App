import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/canteenmeals.dart';

class canteenScreen extends StatefulWidget {
  @override
  State<canteenScreen> createState() => _canteenScreenState();
}

Future<List<CanteenMealType>> CanteenMenu() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Vipul0592bhatia/nmimsdata/master/datafiles/canteenmenu.json'));

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
    mealtypes.add(CanteenMealType(title: "Bhel/Chats", items: canteenitems));

    //Chinese Food
    canteenitems = [];
    items = jsonResponse['Chinese Food'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Chinese Food", items: canteenitems));

//Fast Food
    canteenitems = [];
    items = jsonResponse['Fast Food'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Fast Food", items: canteenitems));

//Frankie
    canteenitems = [];
    items = jsonResponse['Frankie'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Frankie", items: canteenitems));

    //Fresh Juice
    canteenitems = [];
    items = jsonResponse['Fresh Juice'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Fresh Juice", items: canteenitems));

    //Grilled
    canteenitems = [];
    items = jsonResponse['Grilled'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Grilled", items: canteenitems));

    //Hot Beverages
    canteenitems = [];
    items = jsonResponse['Hot Beverages'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Hot Beverages", items: canteenitems));

//Lunch
    canteenitems = [];
    items = jsonResponse['Lunch'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Lunch", items: canteenitems));

//Majedar Lassi
    canteenitems = [];
    items = jsonResponse['Majedar Lassi'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Majedar Lassi", items: canteenitems));

    //Milk Shakes
    canteenitems = [];
    items = jsonResponse['Milk Shakes'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Milk Shakes", items: canteenitems));

    //Pizza
    canteenitems = [];
    items = jsonResponse['Pizza'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes.add(CanteenMealType(title: "Pizza", items: canteenitems));

    //Starter Chinese
    canteenitems = [];
    items = jsonResponse['Starter Chinese'];
    items.forEach((element) {
      String name = element['name'];
      String cost = element['cost'];
      canteenitems.add(CanteenItem(name: name, cost: cost));
    });
    mealtypes
        .add(CanteenMealType(title: "Starter Chinese", items: canteenitems));

    return mealtypes;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
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
    return DefaultTabController(
      length: 12,
      child: FutureBuilder<List<CanteenMealType>>(
        future: futureMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Canteen'),
                //actions: [
                //ElevatedButton ( child: Text('Note!'), onPressed: (){
                //openDialog();
                //},),
                //],
                centerTitle: true,
                bottom: TabBar(isScrollable: true, tabs: [
                  Tab(text: 'Bhel/Chats'),
                  Tab(text: 'Chinese Food'),
                  Tab(text: 'Fast Food'),
                  Tab(text: 'Frankie'),
                  Tab(text: 'Fresh Juice'),
                  Tab(text: 'Grilled'),
                  Tab(text: 'Hot Beverages'),
                  Tab(text: 'Lunch'),
                  Tab(text: 'Majedar Lassi'),
                  Tab(text: 'Milk Shakes'),
                  Tab(text: 'Pizza'),
                  Tab(text: 'Starter Chinese'),
                ]),
              ),
              body: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: snapshot.data![0].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
              shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![0].items[index].name),
                            trailing: Text(snapshot.data![0].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![1].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                                     elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![1].items[index].name),
                            trailing: Text(snapshot.data![1].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![2].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![2].items[index].name),
                            trailing: Text(snapshot.data![2].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![3].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![3].items[index].name),
                            trailing: Text(snapshot.data![3].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![4].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![4].items[index].name),
                            trailing: Text(snapshot.data![4].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![5].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![5].items[index].name),
                            trailing: Text(snapshot.data![5].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![6].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![6].items[index].name),
                            trailing: Text(snapshot.data![6].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![7].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![7].items[index].name),
                            trailing: Text(snapshot.data![7].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![8].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![8].items[index].name),
                            trailing: Text(snapshot.data![8].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![9].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![9].items[index].name),
                            trailing: Text(snapshot.data![9].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![10].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![10].items[index].name),
                            trailing: Text(snapshot.data![10].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data![11].items.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Material(
                           elevation: 20.0,
                            shadowColor: Colors.blue,
                          child: ListTile(
                            title: Text(snapshot.data![11].items[index].name),
                            trailing: Text(snapshot.data![11].items[index].cost),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(
              ),
          );
        },
      ),
    );
  }
}

//Future openDialog() => showDialog(
//context: context,
//builder: (context)=>  AlertDialog(
//title: Text('Comming Soon'),
//));
