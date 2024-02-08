import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  List<String> jobList = [
    'Farmer',
    'Student',
    'Disabled',
    'Government Employ',
    'Women',
    'Teacher',
    'Sports',
    'Military',
  ];
  // List<String> ageList = ['18-25', '26-35', '36-50', '51+'];
  List<String> genderlist = ["Male", "Female"];

  Future<void> postData() async {
    final String url =
        'http://10.0.2.2:8000/AdminUI/register/'; // Replace with your API endpoint

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
              image: AssetImage("asset/img.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.grey[200],
                    height: 70,
                    width: 500,
                    child: Text(
                      'Sigin up',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff37674f),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff37674f),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: usernameController,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff37674f),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff37674f),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff37674f),
                    ),
                    child: DropdownTextField(
                      controller: jobController,
                      items: jobList,
                      hintText: 'Select Job',
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff37674f),
                    ),
                    child: DropdownTextField(
                      controller: genderController,
                      items: genderlist,
                      hintText: 'Select gender',
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff37674f),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: ageController,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Age',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      postData();
                    },
                    child: Text('Sigin UP'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Go to Login'),
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
