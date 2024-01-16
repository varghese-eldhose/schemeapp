// import 'package:http/http.dart' as https;
// import 'package:schemeapp/model/filterscheme.dart';

// class HttpFilterScheme {
//   static Future<dynamic> filterscheme() async {
//     var response =
//         await https.get(Uri.parse("http://10.0.2.2:8000/Scheme/myscheme/"),
//         headers: {"Authorization" : "Bearer "});
//     if (response.statusCode == 200) {
//       var data = response.body;
//       print(response.body);
//       return filterSchemeFromJson(data);
//     }
//   }
// }

import 'package:http/http.dart' as https;
import 'package:schemeapp/model/filterscheme.dart';
import 'package:schemeapp/screens/user/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class HttpFilterScheme {
//   static String authToken =
//       ''; // Static variable to store the authentication token

//   static void setAuthToken(String token) {
//     authToken = token;
//   }

// class HttpFilterScheme {
//   static Future<dynamic> filterscheme() async {
//     // var token = LoginPage.authToken;
//     var response = await https.get(
//       Uri.parse("http://10.0.2.2:8000/Scheme/myscheme/"),
//       headers: {
//         "Authorization":
//             "Bearer "
//       },
//     );
//     if (response.statusCode == 200) {
//       var data = response.body;
//       print(response.body);
//       return filterSchemeFromJson(data);
//     }
//   }
// }

class HttpFilterScheme {
  static Future<dynamic> filterscheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('accessToken') ?? "";

    var response = await https.get(
      Uri.parse("http://10.0.2.2:8000/Scheme/myscheme/"),
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );

    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      return filterSchemeFromJson(data);
    }
  }
}
