import 'package:flutter/material.dart';
import 'package:schemeapp/screens/user/edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late SharedPreferences preferences;

  String storedUsername = '';
  String storedPassword = '';
  String storeEmail = '';
  String storePincode = '';
  String storeAddres = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      storedUsername = preferences.getString('username') ?? '';
      storedPassword = preferences.getString('password') ?? '';
      storeEmail = preferences.getString('email') ?? '';
      storePincode = preferences.getString('pincode') ?? '';
      storeAddres = preferences.getString('Addres') ?? '';
    });
  }

  void updateData() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image.network(
                  "https://img.freepik.com/premium-vector/diverse-multicultural-group-people-standing-together-round-shape_532867-450.jpg"),
            ),
            SizedBox(height: 20.0),
            ListTile(
              title: Text(
                'Username: $storedUsername',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Password: $storedPassword',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Email: $storeEmail',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Pincode: $storePincode',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Address: $storeAddres',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Editprofile()));
                },
                child: Text('Edit Profile'))
          ],
        ),
      ),
    );
  }
}
