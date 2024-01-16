import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schemeapp/screens/admin/admin_post.dart';
// import 'package:scheme_app/components/dropdown.dart';
// import 'package:scheme_app/controller/profile_controller.dart';
// import 'package:scheme_app/dump/pro_cont.dart';
import 'package:schemeapp/screens/user/Siginpage.dart';
import 'package:schemeapp/screens/user/profile_controller.dart';
import 'package:schemeapp/screens/user/home.dart';

void main() {
  runApp(MaterialApp(
    home: AdminScheme(),
  ));
}

class AdminScheme extends StatelessWidget {
  AdminScheme({super.key});

  final AdminSchemeController _adminSchemeController = AdminSchemeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green[300],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Admin page",
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      height: 50,
                      width: double.maxFinite,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Color(0xff080414),
                        ),
                        controller: _adminSchemeController.nameController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Scheme Name',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller: _adminSchemeController.typeController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Type',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller: _adminSchemeController.startageController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Start age',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller: _adminSchemeController.endageController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'End age',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller:
                            _adminSchemeController.descriptionController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Description',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller: _adminSchemeController.linkController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Link',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: GestureDetector(
                        onTap: () => _adminSchemeController.postData(context),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Add Scheme",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
