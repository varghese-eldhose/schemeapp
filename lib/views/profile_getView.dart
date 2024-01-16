import 'package:flutter/material.dart';
import 'package:schemeapp/model/profile_model.dart';
import 'package:schemeapp/service/profile_dervice.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import your profile model

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  GetProfile? _profile;

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
        padding: const EdgeInsets.all(16.0),
        child: _profile != null
            ? _buildProfileDetails(_profile!)
            : _buildLoadingIndicator(),
      ),
    );
  }

  Widget _buildProfileDetails(GetProfile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text('User ID: ${profile.user}'),
        Text('Address: ${profile.address}'),
        Text('State: ${profile.state}'),
        Text('Pincode: ${profile.pincode}'),
        Text('Profession: ${profile.profession}'),
        Text('Card: ${profile.card}'),
        Text('Qualification: ${profile.qual}'),
        Text('Disabled: ${profile.disable}'),
        Text('Aadhar Number: ${profile.aadharNumber}'),
        Text('Contact: ${profile.contact}'),
      ],
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
