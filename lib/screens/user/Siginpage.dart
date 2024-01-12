import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:schemeapp/screens/user/loginpage.dart';

void main() {
  runApp(MaterialApp(
    home: Siginup(),
  ));
}

class Siginup extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Siginup> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  List<String> jobList = ['Farmer', 'Student', 'Disabled', 'Other'];
  // List<String> ageList = ['18-25', '26-35', '36-50', '51+'];
  List<String> genderlist = ["Male", "Female"];

  Future<void> postData() async {
    final String url =
        'http://10.0.2.2:8000/AdminUI/register/'; // Replace with your API endpoint

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
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'age': ageController.text.trim(),
        'profession': jobController.text.trim(),
        'gender': genderController.text.trim()
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1613125700782-8394bec3e89d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    height: 50,
                    color: Colors.transparent,
                    width: double.maxFinite,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black)),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  DropdownTextField(
                    controller: jobController,
                    items: jobList,
                    hintText: 'Select Job',
                  ),
                  SizedBox(height: 16),
                  DropdownTextField(
                    controller: genderController,
                    items: genderlist,
                    hintText: 'Select gender',
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                        labelText: 'Age',
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
