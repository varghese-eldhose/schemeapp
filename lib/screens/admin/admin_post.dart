import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schemeapp/screens/admin/admin_all.dart';
import 'package:schemeapp/screens/user/home.dart';
import 'package:http/http.dart' as http;

class AdminSchemeController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController startageController = TextEditingController();
  final TextEditingController endageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  Future<void> postData(BuildContext context) async {
    final String url = 'http://10.0.2.2:8000/Scheme/scheme/';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'Scheme_Name': nameController.text,
        'type': typeController.text.trim(),
        'start_age': startageController.text.trim(),
        'end_age': endageController.text.trim(),
        'Description': descriptionController.text.trim(),
        'Link': linkController.text.trim(),
      },
    );
    if (response.statusCode == 201) {
      Get.snackbar("Successful", "Scheme Added");
      Get.to(AdminAllScheme());
      print("success");

      nameController.clear();
      typeController.clear();
      startageController.clear();
      endageController.clear();
      descriptionController.clear();
      linkController.clear();
    } else {
      print(response.statusCode);
      print("Error");
    }
  }
}
