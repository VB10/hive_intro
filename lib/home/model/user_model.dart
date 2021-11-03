// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'package:hive_flutter/adapters.dart';
import 'package:hive_intro/constant/hive_constants.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveConstants.userTypeId)
class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;

  Address? address;

  @HiveField(4)
  String? phone;

  @HiveField(5)
  String? website;

  @HiveField(6)
  Company? company;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? json["id"],
        name: json["name"] ?? json["name"],
        username: json["username"] ?? json["username"],
        email: json["email"] ?? json["email"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"] ?? json["phone"],
        website: json["website"] ?? json["website"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? id,
        "name": name ?? name,
        "username": username ?? username,
        "email": email ?? email,
        "address": address ?? address?.toJson(),
        "phone": phone ?? phone,
        "website": website ?? website,
        "company": company ?? company?.toJson(),
      };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"] ?? json["street"],
        suite: json["suite"] ?? json["suite"],
        city: json["city"] ?? json["city"],
        zipcode: json["zipcode"] ?? json["zipcode"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street ?? street,
        "suite": suite ?? suite,
        "city": city ?? city,
        "zipcode": zipcode ?? zipcode,
        "geo": geo ?? geo?.toJson(),
      };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"] ?? json["lat"],
        lng: json["lng"] ?? json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat ?? lat,
        "lng": lng ?? lng,
      };
}

@HiveType(typeId: HiveConstants.userTypeCompanyId)
class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? catchPhrase;
  @HiveField(2)
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] ?? json["name"],
        catchPhrase: json["catchPhrase"] ?? json["catchPhrase"],
        bs: json["bs"] ?? json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? name,
        "catchPhrase": catchPhrase ?? catchPhrase,
        "bs": bs ?? bs,
      };
}
