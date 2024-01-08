import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      usernameController.text = preferences.getString('username') ?? '';
      passwordController.text = preferences.getString('password') ?? '';
      emailController.text = preferences.getString('email') ?? '';
      pincodeController.text = preferences.getString('pincode') ?? '';
      addressController.text = preferences.getString('Addres') ?? '';
    });
  }

  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('username', usernameController.text);
    preferences.setString('password', passwordController.text);
    preferences.setString('email', emailController.text);
    preferences.setString('pincode', pincodeController.text);
    preferences.setString('Addres', addressController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextFields for editing profile information
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: pincodeController,
              decoration: InputDecoration(labelText: 'Pincode'),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
  onPressed: () {
    setState(() {
      saveData();
    });
    Navigator.pop(context);
  },
  child: Text('Save'),
),
          ],
        ),
      ),
    );
  }
}
