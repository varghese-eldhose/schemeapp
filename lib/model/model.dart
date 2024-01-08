// To parse this JSON data, do
//
//     final schmeModel = schmeModelFromJson(jsonString);

import 'dart:convert';

List<SchmeModel> schmeModelFromJson(String str) => List<SchmeModel>.from(json.decode(str).map((x) => SchmeModel.fromJson(x)));

String schmeModelToJson(List<SchmeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchmeModel {
    String? schemeName;
    String? schmeModelNew;
    String? description;
    String? link;

    SchmeModel({
        this.schemeName,
        this.schmeModelNew,
        this.description,
        this.link,
    });

    factory SchmeModel.fromJson(Map<String, dynamic> json) => SchmeModel(
        schemeName: json["Scheme_Name"],
        schmeModelNew: json["new"],
        description: json["Description"],
        link: json["Link"],
    );

    Map<String, dynamic> toJson() => {
        "Scheme_Name": schemeName,
        "new": schmeModelNew,
        "Description": description,
        "Link": link,
    };
}
