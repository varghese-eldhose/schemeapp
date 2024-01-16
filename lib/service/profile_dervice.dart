import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schemeapp/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static Future<GetProfile> getProfileDetails(String token) async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('accessToken') ?? "";
    
    final url = 'http://10.0.2.2:8000/AdminUI/profile/'; 
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return GetProfile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile details');
    }
  }
}
