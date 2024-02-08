import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schemeapp/controller/noti_controller.dart';
import 'package:schemeapp/views/Mysche.dart';

class NotificationViews extends StatelessWidget {
  final NotifiController _notifiController = Get.put(NotifiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Obx(
          () => GestureDetector(
            onTap: () => Get.to(FilterSchemePage()),
            child: Card(
              child: Text(
                _notifiController.noticationss.value,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
