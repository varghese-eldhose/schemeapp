import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schemeapp/screens/user/loginpage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  
    Timer(
      Duration(seconds: 6),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.network("https://www.logopeople.in/wp-content/uploads/2013/01/government-of-india.jpg")
            
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashPage(),
    debugShowCheckedModeBanner: false,
  ));
}
