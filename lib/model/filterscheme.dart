// To parse this JSON data, do
//
//     final filterScheme = filterSchemeFromJson(jsonString);

import 'dart:convert';

List<FilterScheme> filterSchemeFromJson(String str) => List<FilterScheme>.from(json.decode(str).map((x) => FilterScheme.fromJson(x)));

String filterSchemeToJson(List<FilterScheme> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterScheme {
    String? schemeName;
    String? type;
    int? startAge;
    int? endAge;
    String? description;
    String? link;

    FilterScheme({
        this.schemeName,
        this.type,
        this.startAge,
        this.endAge,
        this.description,
        this.link,
    });

    factory FilterScheme.fromJson(Map<String, dynamic> json) => FilterScheme(
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
