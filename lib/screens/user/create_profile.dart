import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/screens/user/Siginpage.dart';
import 'package:schemeapp/screens/user/profile_controller.dart';
import 'package:schemeapp/screens/user/home.dart';

void main() {
  runApp(MaterialApp(
    home: CreateProfile(),
  ));
}

class CreateProfile extends StatelessWidget {
  CreateProfile({super.key});

  final ProfileController _profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                        "Create Profile",
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
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Color(0xff080414),
                        ),
                        controller: _profileController.addressController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Address',
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
                        controller: _profileController.stateController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'State',
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
                        controller: _profileController.pincodeController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Pincode',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: DropdownTextField(
                        controller: _profileController.professionController,
                        items: _profileController.jobList,
                        hintText: 'Profession',
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: DropdownTextField(
                        controller: _profileController.cardController,
                        items: _profileController.card,
                        hintText: 'Card',
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: DropdownTextField(
                        controller: _profileController.qualController,
                        items: _profileController.qual,
                        hintText: 'Qualification',
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: DropdownTextField(
                        controller: _profileController.disableController,
                        items: _profileController.disable,
                        hintText: 'Disability',
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller: _profileController.aadharController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Aadhar Number',
                        ),
                        obscureText: false,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: TextField(
                        controller: _profileController.contactController,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Contact',
                        ),
                        obscureText: false,
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: GestureDetector(
                        onTap: () => _profileController.postData(context),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Create",
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
                    InkWell(
                        onTap: () => Get.to(SchemePage()), child: Text("Skip"))
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
