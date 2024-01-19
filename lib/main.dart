import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/screens/user/Siginpage.dart';
import 'package:schemeapp/screens/user/admin.dart';
import 'package:schemeapp/screens/user/loginpage.dart';
import 'package:schemeapp/screens/user/splash.dart';
import 'package:schemeapp/views/Mysche.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashPage(),
    );
  }
}
