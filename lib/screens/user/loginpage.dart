import 'package:flutter/material.dart';
import 'package:schemeapp/screens/user/Siginpage.dart';
import 'package:schemeapp/screens/user/admin.dart';
import 'package:schemeapp/screens/user/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1517021818302-9b520a06c834?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwyMTAwMTE1fHxlbnwwfHx8fHw%3D"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                Icon(
                  Icons.person,
                  size: 48.0,
                  color: Colors.black,
                ),
                Text(
                  'Welcome to login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.abc),
                  suffixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.remove_red_eye),
                  suffixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                validateAndLogin();
              },
              child: Text('Login'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text("register"))
          ],
        ),
      ),
    );
  }

  void validateAndLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String storedUsername = preferences.getString('username') ?? "";
    String storedPassword = preferences.getString('password') ?? "";

    String enteredUsername = usernameController.text.trim();
    String enteredPassword = passwordController.text.trim();

    {
      if (enteredUsername == "admin" && enteredPassword == "admin") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Admin()));
      } else if (enteredUsername == storedUsername &&
          enteredPassword == storedPassword) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        _showErrorDialog(context, 'Invalid username');
      }
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
