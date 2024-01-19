import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:schemeapp/model/notifi_model.dart';

class HttpNotifiScheme {
  static Future<dynamic> notificationscheme() async {
    final url = 'http://10.0.2.2:8000/Scheme/notification/';
    final response = await https.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return (response.body);
    } else {
      throw Exception('Failed to load profile details');
    }
  }
}
