// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/controller/filter_scheme_controller.dart';
import 'package:schemeapp/controller/new_schem_controller.dart';
import 'package:schemeapp/model/filterscheme.dart';
import 'package:schemeapp/model/new_scheme_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewSchemePage extends StatelessWidget {
  final NewSchemeController newSchemeController =
      Get.put(NewSchemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        centerTitle: true,
        title: Text(
          "New Schemes",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: newSchemeController.newScheme.length,
          itemBuilder: (context, index) {
            NewScheme newScheme = newSchemeController.newScheme[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${newScheme.schemeName}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${newScheme.description}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => launchURL(newScheme.link),
                        child: Text(
                          '${newScheme.link}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      //
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            );
          },
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
