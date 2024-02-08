import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schemeapp/model/profile_model.dart';
import 'package:schemeapp/screens/user/edit_profile.dart';
import 'package:schemeapp/screens/user/profile_controller.dart';
import 'package:schemeapp/service/profile_dervice.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
// Import your profile model

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  GetProfile? _profile;

  final ProfileController _profileController = ProfileController();

  @override
  void initState() {
    super.initState();
    // Fetch profile details when the widget is initialized
    _loadProfileDetails();
  }

  Future<void> _loadProfileDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('accessToken') ?? "";

    try {
      // Replace 'YOUR_ACCESS_TOKEN' with the actual token you want to use
      // String accessToken = accessToken;;
      GetProfile profile = await ProfileService.getProfileDetails(accessToken);
      setState(() {
        _profile = profile;
      });
    } catch (e) {
      print('Error loading profile details: $e');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: _profile != null
            ? _buildProfileDetails(_profile!)
            : _buildLoadingIndicator(),
      ),
    );
  }

  Widget _buildProfileDetails(GetProfile profile) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: double.infinity,
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
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      " Profile",
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    height: 50,
                    width: double.maxFinite,
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Address: ${profile.address}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'state: ${profile.state}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Pincode: ${profile.pincode}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
  
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Profession: ${profile.profession}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Card: ${profile.card}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Qualification: ${profile.qual}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
               
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'disability: ${profile.disable}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Aadhar no: ${profile.aadharNumber}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      'Contact: ${profile.contact}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                      // controller: _profileController.addressController,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GestureDetector(
                      onTap: () => Get.to(EditProfile()),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Edit",
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
                  // InkWell(onTap: () => Get.to(SchemePage()), child: Text("Skip"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileView(),
  ));
}
