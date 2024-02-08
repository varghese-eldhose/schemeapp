// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/controller/control.dart';
import 'package:schemeapp/model/model.dart';
import 'package:schemeapp/screens/user/loginpage.dart';
import 'package:schemeapp/screens/user/notifi_view.dart';
import 'package:schemeapp/views/Mysche.dart';
import 'package:schemeapp/views/newScheme.dart';
import 'package:schemeapp/views/profile_getView.dart';
import 'package:url_launcher/url_launcher.dart';

class SchemePage extends StatelessWidget {
  final SchemeController schemeController = Get.put(SchemeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => "",
                  child: Text(
                    'User Name ', // Replace with the actual user name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('My Profile', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => EditProfile()),
                    MaterialPageRoute(builder: (context) => ProfileView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Scheme', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterSchemePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('All Scheme', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SchemePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('New Scheme', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NewSchemePage()),
                  );
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.star),
              //   title: Text('Notifications', style: TextStyle(fontSize: 20)),
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => NotificationViews()),
              //     );
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          centerTitle: true,
          title: Text(
            "My Scheme",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: schemeController.list.length,
            itemBuilder: (context, index) {
              SchmeModel scheme = schemeController.list[index];

              return Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        '${scheme.schemeName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Text(
                          '${scheme.description}',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchURL(scheme.link);
                        },
                        child: Text(
                          '${scheme.link}',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                    
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void launchURL(String? link) async {
    if (await canLaunch(link!)) {
      await launch(link,
          forceSafariVC: false, forceWebView: false, enableJavaScript: true);
    } else {
      throw 'Could not launch $link';
    }
  }
}
