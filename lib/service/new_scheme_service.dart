import 'package:http/http.dart' as https;
import 'package:schemeapp/model/new_scheme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpNewScheme {
  static Future<dynamic> newscheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('accessToken') ?? "";

    var response = await https.get(
      Uri.parse("http://10.0.2.2:8000/Scheme/new_elements/"),
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );

    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      return newSchemeFromJson(data);
    }
  }
}
