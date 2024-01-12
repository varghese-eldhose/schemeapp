// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:schemeapp/screens/user/Siginpage.dart';
// import 'package:schemeapp/screens/user/homepage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   static String authToken = '';

//   Future<void> login() async {
//     String username = _usernameController.text;
//     String password = _passwordController.text;

//     // Replace the URL with your authentication endpoint
//     String loginUrl = 'http://10.0.2.2:8000/login/';

//     try {
//       final response = await http.post(
//         Uri.parse(loginUrl),
//         body: {'username': username, 'password': password},
//       );

//       if (response.statusCode == 200) {

//         print(response.body);

//         authToken = response.body;

//         print("token is :$authToken");

//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ),
//         );
//       } else {
//         // Show error message for unsuccessful login
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Invalid credentials. Please try again.'),
//           ),
//         );
//       }
//     } catch (e) {
//       // Handle network errors or other exceptions
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error occurred. Please try again.'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//                 "https://images.unsplash.com/photo-1613125700782-8394bec3e89d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               TextField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: login,
//                 child: Text('Login'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => Siginup(),
//                   ));
//                 },
//                 child: Text(
//                   "Don't have an account? Sign in",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schemeapp/screens/user/Siginpage.dart';
import 'package:schemeapp/screens/user/home.dart';
import 'package:schemeapp/screens/user/homepage.dart';
import 'package:schemeapp/service/filter_scheme_serrvice.dart';
import 'package:schemeapp/views/scheme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/login/'),
      body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      var responseMap = jsonDecode(response.body);
      String accessToken = responseMap['access'];

      print("accesssssstoken is :$accessToken");
      print(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SchemePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid credentials. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1613125700782-8394bec3e89d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: login,
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Siginup(),
                  ));
                },
                child: Text(
                  "Don't have an account? Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
