import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:schemeapp/screens/user/loginpage.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}

class Profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController qualController = TextEditingController();
  final TextEditingController disableController = TextEditingController();

  List<String> profession = ['Farmer', 'Student', 'Disabled', 'Other'];
  // List<String> ageList = ['18-25', '26-35', '36-50', '51+'];
  List<String> card = ["Apl", "Bpl", "Aay"];
  List<String> qual = ["sslc", "Plus tow", "ug", "pg"];
  List<String> disable = [
    "Mobility impairment",
    "visual impairment",
    "Hearing impairment",
    "Learing Disabilty",
    "Autism Spectrum Disoder",
    "Speach Imaariment",
    "Inrellectual Disability"
  ];

  Future<void> postData() async {
    final String url =
        'http://10.0.2.2:8000/AdminUI/profile/'; // Replace with your API endpoint

    // final Map<String, String> data = {
    //   'username': usernameController.text,
    //   'email': emailController.text,
    //   'password': passwordController.text,
    //   'profession': jobController.text,
    //   'age': ageController.text,
    // };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type':
            'application/x-www-form-urlencoded', // Adjust the content type if needed
      },
      body: {
        // 'username': usernameController.text.trim(),
        // 'email': emailController.text.trim(),
        // 'password': passwordController.text.trim(),
        // 'age': ageController.text.trim(),
        // 'profession': jobController.text.trim(),
        // 'gender': genderController.text.trim()

        'user': usernameController.text.trim(),
        'Address': addressController.text.trim(),
        'State': stateController.text.trim(),
        'Pincode': pinController.text.trim(),
        'Aadhar_Number': aadharController.text.trim(),
        'Contact': contactController.text.trim(),
        'profession': professionController.text.trim(),
        'card': cardController.text.trim(),
        'qual': qualController.text.trim(),
        'disable': disableController.text.trim(),
      },
    );
    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
      print("success");
    } else {
      print(response.statusCode);
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      height: 50,
                      color: Colors.transparent,
                      width: double.maxFinite,
                    ),
                    // SizedBox(
                    //   height: 100,
                    // ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                          labelText: 'address',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: stateController,
                      decoration: InputDecoration(
                          labelText: 'state',
                          labelStyle: TextStyle(color: Colors.black)),
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: pinController,
                      decoration: InputDecoration(
                          labelText: 'pincode',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: aadharController,
                      decoration: InputDecoration(
                          labelText: 'aadhar no',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: professionController,
                      decoration: InputDecoration(
                          labelText: 'job',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    DropdownTextField(
                      controller: cardController,
                      items: card,
                      hintText: 'Ration card',
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: qualController,
                      decoration: InputDecoration(
                          labelText: 'qualificcation',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: disableController,
                      decoration: InputDecoration(
                          labelText: 'category',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: contactController,
                      decoration: InputDecoration(
                          labelText: 'contact',
                          labelStyle: TextStyle(color: Colors.black)),
                      obscureText: false,
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        postData();
                      },
                      child: Text('Post Data'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;
  final String hintText;

  const DropdownTextField({
    Key? key,
    required this.controller,
    required this.items,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        suffixIcon: PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          onSelected: (value) {
            controller.text = value;
          },
          itemBuilder: (BuildContext context) {
            return items.map<PopupMenuItem<String>>((String value) {
              return PopupMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
