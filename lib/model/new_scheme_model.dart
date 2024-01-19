// To parse this JSON data, do
//
//     final newScheme = newSchemeFromJson(jsonString);

import 'dart:convert';

List<NewScheme> newSchemeFromJson(String str) => List<NewScheme>.from(json.decode(str).map((x) => NewScheme.fromJson(x)));

String newSchemeToJson(List<NewScheme> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewScheme {
    String? schemeName;
    String? type;
    int? startAge;
    int? endAge;
    String? description;
    String? link;

    NewScheme({
        this.schemeName,
        this.type,
        this.startAge,
        this.endAge,
        this.description,
        this.link,
    });

    factory NewScheme.fromJson(Map<String, dynamic> json) => NewScheme(
        schemeName: json["Scheme_Name"],
        type: json["type"],
        startAge: json["start_age"],
        endAge: json["end_age"],
        description: json["Description"],
        link: json["Link"],
    );

    Map<String, dynamic> toJson() => {
        "Scheme_Name": schemeName,
        "type": type,
        "start_age": startAge,
        "end_age": endAge,
        "Description": description,
        "Link": link,
    };
}
