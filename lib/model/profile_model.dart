// To parse this JSON data, do
//
//     final getProfile = getProfileFromJson(jsonString);

import 'dart:convert';

GetProfile getProfileFromJson(String str) =>
    GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class GetProfile {
  int? user;
  String? address;
  String? state;
  int? pincode;
  String? profession;
  String? card;
  String? qual;
  String? disable;
  int? aadharNumber;
  int? contact;

  GetProfile({
    this.user,
    this.address,
    this.state,
    this.pincode,
    this.profession,
    this.card,
    this.qual,
    this.disable,
    this.aadharNumber,
    this.contact,
  });

  factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
        user: json["user"],
        address: json["Address"],
        state: json["State"],
        pincode: json["Pincode"],
        profession: json["profession"],
        card: json["card"],
        qual: json["qual"],
        disable: json["disable"],
        aadharNumber: json["Aadhar_Number"],
        contact: json["Contact"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "Address": address,
        "State": state,
        "Pincode": pincode,
        "profession": profession,
        "card": card,
        "qual": qual,
        "disable": disable,
        "Aadhar_Number": aadharNumber,
        "Contact": contact,
      };
}
