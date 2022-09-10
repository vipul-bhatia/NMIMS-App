import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class linksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Links'),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.blue,
                child: ListTile(
                    title: Text(
                  'Academics',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )),
              ),
            ),
            Material(
              elevation: 20.0,
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  'Portal Link New',
                  style: TextStyle(fontSize: 19),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () =>
                      launch('http://svkmepdbci.svkm.ac.in:50100/irj/portal'),
                ),
              ),
            ),
            Material(
              elevation: 20.0,
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  'Portal Link Old',
                  style: TextStyle(fontSize: 19),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () =>
                      launch('https://portal.svkm.ac.in/usermgmt/login'),
                ),
              ),
            ),
            Padding(
               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.blue,
                child: ListTile(
                    title: Text(
                  'E Library',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
              ),
            ),
            Material(
              elevation: 20.0,
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  'E Library Resources',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () => launch('https://ezproxy.svkm.ac.in/login'),
                ),
              ),
            ),
            Padding(
               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.blue,
                child: ListTile(
                  title: Text(
                    'Results',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  trailing: Text('Coming Soon'),
                ),
              ),
            ),
            Padding(
               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.blue,
                child: ListTile(
                    title: Text(
                  'Brochure',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
              ),
            ),
            Material(
              elevation: 20.0,
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  'Brochure Link',
                  style: TextStyle(fontSize: 19),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () => launch(
                      'https://www.nmims.edu/docs/Brochure%202021-22%20Shirpur%20Campus.pdf'),
                ),
              ),
            ),
          ],
        ));
  }
}
