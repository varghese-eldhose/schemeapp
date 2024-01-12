// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/controller/filter_scheme_controller.dart';
import 'package:schemeapp/model/filterscheme.dart';
import 'package:url_launcher/url_launcher.dart';

class FilterSchemePage extends StatelessWidget {
  final FilterSchemeController filterSchemeController =
      Get.put(FilterSchemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        centerTitle: true,
        title: Text(
          "Filter Scheme",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: filterSchemeController.flist.length,
          itemBuilder: (context, index) {
            FilterScheme filterScheme = filterSchemeController.flist[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  // height: 70,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${filterScheme.schemeName}',
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
                        '${filterScheme.description}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => launchURL(filterScheme.link),
                        child: Text(
                          '${filterScheme.link}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      // Container(
                      //   child: Text('${scheme.description}'),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     launchURL(scheme.link);
                      //   },
                      //   child: Text(
                      //     '${scheme.link}',
                      //     style: TextStyle(
                      //       color: Colors.blue,
                      //       decoration: TextDecoration.underline,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 5),
                      // Container(
                      //   width: 80,
                      //   height: 35,
                      //   child: Card(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     shadowColor: const Color.fromARGB(255, 246, 16, 0),
                      //     child: Center(child: Text('${scheme.schmeModelNew}')),
                      //   ),
                      // ),

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
