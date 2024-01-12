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

// class HttpFilterScheme {
//   static String authToken =
//       ''; // Static variable to store the authentication token

//   static void setAuthToken(String token) {
//     authToken = token;
//   }

class HttpFilterScheme {
  static Future<dynamic> filterscheme() async {
    // var token = LoginPage.authToken;
    var response = await https.get(
      Uri.parse("http://10.0.2.2:8000/Scheme/myscheme/"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA1MDc2Njc2LCJpYXQiOjE3MDUwNDA2NzYsImp0aSI6ImE1MTYxMDY4MTEzYzRkMzZiN2EzMTRhYWE5Y2NlZDVkIiwidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInBhc3N3b3JkIjoicGJrZGYyX3NoYTI1NiQ2MDAwMDAkQ2JMZUowamNROGxhVWJET1ludHdlTSR0aEk4Yk9MZzNKWGw3Q0Z5eDZJV1JBVUJydm8rZHRPRlUvNy9GaytHRnE0PSIsImF1dGgiOnRydWV9.99hg34HC6zTC9nOu1q2_9-Vh4S6_J36cWilDV28AFHs"
      },
    );
    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      return filterSchemeFromJson(data);
    }
  }
}
