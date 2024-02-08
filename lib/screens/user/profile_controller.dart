import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schemeapp/screens/user/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController qualController = TextEditingController();
  final TextEditingController disableController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  List<String> jobList = [
    'Farmer',
    'Student',
    'Disabled',
    'Government Employ',
    'Women',
    'Teacher',
    'Sports',
    'Military'
  ];
  List<String> genderlist = ["Male", "Female"];
  List<String> card = ["APL", "BPL", "AAY"];
  List<String> qual = ["SSLC", "PLUS TWO", "UG", "PG"];
  List<String> disable = [
    "Mobility Impairment",
    "Visual Impairment",
    "Hearing Impairment",
    "Learning Disability",
    "Autism Spectrum Disorder",
    "Speech Impairment",
    "Intellectual Disability",
    "None"
  ];

  Future<void> postData(BuildContext context) async {
    final String url = 'http://10.0.2.2:8000/AdminUI/profile/';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getInt('user_id') ?? "";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'user': user_id.toString(),
        'Address': addressController.text.trim(),
        'State': stateController.text.trim(),
        'Pincode': pincodeController.text.trim(),
        'profession': professionController.text.trim(),
        'card': cardController.text.trim(),
        'qual': qualController.text.trim(),
        'disable': disableController.text.trim(),
        'Aadhar_Number': aadharController.text.trim(),
        'Contact': contactController.text.trim(),
      },
    );
    if (response.statusCode == 201) {
      Get.to(SchemePage());
      print("success");
    } else {
      print(response.statusCode);
      print("Error");
      print("User issss $user_id");
    }
  }

  Future<void> getData(BuildContext context) async {
    final String url = 'http://10.0.2.2:8000/AdminUI/profile/';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        print("Data retrieved successfully");
      } else {
        print("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> putData(BuildContext context) async {
    final String url = 'http://10.0.2.2:8000/AdminUI/profile/';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getInt('user_id') ?? "";
    var accessToken = prefs.getString('accessToken') ?? "";

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $accessToken',
          // 'Content-Type': 'application/json',
        },
        body: {
          'user': user_id.toString(),
          'Address': addressController.text.trim(),
          'State': stateController.text.trim(),
          'Pincode': pincodeController.text.trim(),
          'profession': professionController.text.trim(),
          'card': cardController.text.trim(),
          'qual': qualController.text.trim(),
          'disable': disableController.text.trim(),
          'Aadhar_Number': aadharController.text.trim(),
          'Contact': contactController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        Get.to(SchemePage());
        print("success");
      } else {
        print(response.statusCode);
        print("Error");
        print("User issss $user_id");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
