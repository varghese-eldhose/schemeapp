import 'package:get/get.dart';
import 'package:schemeapp/service/new_scheme_service.dart';

class NewSchemeController extends GetxController {
  var newScheme = [].obs;

  @override
  void onInit() {
    newSchemes();
    super.onInit();
  }

  void newSchemes() async {
    try {
      var data = await HttpNewScheme.newscheme();
      if (data != null) {
        newScheme.value = data;
      }
    } catch (e) {
      print(e);
    }
  }
}
