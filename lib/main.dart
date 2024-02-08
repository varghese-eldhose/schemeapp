import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/screens/user/splash.dart';

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
