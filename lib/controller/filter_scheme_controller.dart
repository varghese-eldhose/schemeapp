import 'package:get/get.dart';
import 'package:schemeapp/service/filter_scheme_serrvice.dart';

class FilterSchemeController extends GetxController {
  var flist = [].obs;

  @override
  void onInit() {
    getfilterScheme();
    super.onInit();
  }

  void getfilterScheme() async {
    try {
      var data = await HttpFilterScheme.filterscheme();
      if (data != null) {
        flist.value = data;
      }
    } catch (e) {
      print(e);
    }
  }
}
