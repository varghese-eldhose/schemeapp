import 'dart:convert';

import 'package:get/get.dart';
import 'package:schemeapp/model/notifi_model.dart';
import 'package:schemeapp/service/notifi_service.dart';

class NotifiController extends GetxController {
  var noticationss = "".obs;

  @override
  void onInit() {
    notifiScheme();
    super.onInit();
  }

  void notifiScheme() async {
    try {
      var data = await HttpNotifiScheme.notificationscheme();
      var jsond = json.decode(data);
      Notifications notifications = Notifications.fromJson(jsond);
      noticationss.value = notifications.message!;
    } catch (e) {
      print(e);
    }
  }
}
