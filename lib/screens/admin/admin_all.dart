// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/controller/control.dart';
import 'package:schemeapp/model/model.dart';
import 'package:schemeapp/screens/user/get_profile.dart';
import 'package:schemeapp/screens/user/loginpage.dart';
import 'package:schemeapp/screens/user/create_profile.dart';
import 'package:schemeapp/views/Mysche.dart';
import 'package:schemeapp/views/profile_getView.dart';
// import 'package:schemeapp/views/uu.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminAllScheme extends StatelessWidget {
  final SchemeController schemeController = Get.put(SchemeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          centerTitle: true,
          title: Text(
            "Admin View",
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

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
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
                      ],
                    ),
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
