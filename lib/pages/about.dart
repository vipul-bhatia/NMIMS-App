import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: AssetImage('Assets/nointernet.jpg')),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made with DoT.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Our Developers",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //circle avatar with text below it
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage: AssetImage('Assets/nointernet.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
               
                Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage: AssetImage('Assets/nointernet.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage: AssetImage('Assets/nointernet.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
             Material(
                elevation: 20.0,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        ''' sdjhfgviuerhvkjbsd
      cajwebfbkjrcbakr;jcajvvvvvvvbbbbbbbbbbbbbbbbbbb
      qwcab lircb;qjbcoj
      ,eakvbqjrbviqahofh;oib
      jaebfiruvferhficbdskjvkjasdn
      akjdbcvlkerbcke''',
                        style: TextStyle(),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
               Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              size: 32,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () => launch('mailto: fd.email'),
                          child: Center(
                            child: Icon(
                              Icons.email,
                              size: 32,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              size: 32,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () => launch("tel: fd.phone"),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.phone,
                              size: 32,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
      
          ],
        ),
      ),
    );
  }
}
