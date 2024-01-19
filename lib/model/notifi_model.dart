// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
    String? message;

    Notifications({
        this.message,
    });

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
