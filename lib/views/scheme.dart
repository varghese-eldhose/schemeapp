import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/controller/control.dart';
import 'package:schemeapp/model/model.dart';
import 'package:url_launcher/url_launcher.dart';


class SchemePage extends StatelessWidget {
  final SchemeController schemeController = Get.put(SchemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text('${scheme.description}'),
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
                    Container(
                      width: 80,
                      height: 35,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: const Color.fromARGB(255, 246, 16, 0),
                        child: Center(child: Text('${scheme.schmeModelNew}')),
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
