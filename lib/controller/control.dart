import 'package:get/get.dart';
import 'package:schemeapp/service/service.dart';

class SchemeController extends GetxController {
  var list = [].obs;

  @override
  void onInit() {
    getScheme();
    super.onInit();
  }

  void getScheme() async {
    try {
      var data = await HttpScheme.fetchscheme();
      if (data != null) {
        list.value = data;
      }
    } catch (e) {
      print(e);
    }
  }
}
