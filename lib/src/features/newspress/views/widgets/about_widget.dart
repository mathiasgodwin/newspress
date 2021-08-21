import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(0.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 15,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(0.4),
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildInfo1(),
            _buildInfo2(),
            _buildInfo3(),
            _buildInfo4()
          ],
        ),
      ),
    );
  }

  Widget _buildInfo1() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Image.asset(
                          'assets/icon/newspress_icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('ℕewspress'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("Version"),
                    subtitle: Text("1.0.0"),
                  ),
                  // Divider(),
                  // ListTile(
                  //   leading: Icon(Icons.cached),
                  //   title: Text("Changelog"),
                  // ),
                  // Divider(),
                  // ListTile(
                  //     leading: Icon(Icons.offline_pin), title: Text("License")),
                ],
              )),
        ));
  }

  Widget _buildInfo2() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Author',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Mathias Godwin"),
                    subtitle: Text("\n+2347061009672 \ngodwinsaint6@gmail.com"),
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo3() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Company',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("Gwinivac"),
                    subtitle: Text("Software Development"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Akure, Nigeria"),
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo4() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Credits',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  ListTile(
                    leading: Icon(Icons.person_outline_rounded),
                    title: Text("Gaurav Tantuway"),
                    subtitle: Text("+919752614355"),
                  ),
                ],
              )),
        ));
  }
}
