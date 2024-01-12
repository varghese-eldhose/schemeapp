import 'package:http/http.dart' as https;
import 'package:schemeapp/model/model.dart';

class HttpScheme {
  static Future<dynamic> fetchscheme() async {
    var response = await https
        .get(Uri.parse("http://10.0.2.2:8000/Scheme/scheme/?format=json"),
        // headers: {"auth":"Bearer rtdyfgujoikl"}
        );
    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      return schmeModelFromJson(data);
    }
  }
}
