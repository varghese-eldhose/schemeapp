import 'package:http/http.dart' as https;
import 'package:schemeapp/model/filterscheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// import 'package:http/http.dart' as https;
// import 'package:schemeapp/model/filterscheme.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HttpFilterScheme {
//   static Future<dynamic> filterscheme() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var accessToken = prefs.getString('accessToken');
//       print('Access Token: $accessToken');

//       var response = await https.get(
//         Uri.parse("http://10.0.2.2:8000/Scheme/myscheme/"),
//         headers: {
//           "Authorization": "Bearer $accessToken",
//           "Cache-Control": "no-cache",
//         },
//       );

//       print('Response Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         var data = response.body;
//         print('Response Body: $data');
//         List<FilterScheme> filteredData = filterSchemeFromJson(data);
//         return filteredData;
//       } else {
//         throw Exception('Failed to fetch schemes: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error filtering schemes: $error');
//       throw Exception('Error filtering schemes: $error');
//     }
//   }
// }
