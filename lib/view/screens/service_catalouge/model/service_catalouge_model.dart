// To parse this JSON data, do
//
//     final serviceListModel = serviceListModelFromJson(jsonString);

import 'dart:convert';

ServiceListModel serviceListModelFromJson(String str) =>
    ServiceListModel.fromJson(json.decode(str));

String serviceListModelToJson(ServiceListModel data) =>
    json.encode(data.toJson());

class ServiceListModel {
  String? message;
  List<Service>? services;

  ServiceListModel({
    this.message,
    this.services,
  });

  factory ServiceListModel.fromJson(Map<String, dynamic> json) =>
      ServiceListModel(
        message: json["message"],
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  int? id;
  int? categoryId;
  int? providerId;
  String? serviceName;
  String? serviceDescription;
  List<String>? gallaryPhoto;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? setBookingMony;
  List<AvailableServiceOur>? availableServiceOur;
  DateTime? createdAt;
  DateTime? updatedAt;

  Service({
    this.id,
    this.categoryId,
    this.providerId,
    this.serviceName,
    this.serviceDescription,
    this.gallaryPhoto,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
    this.setBookingMony,
    this.availableServiceOur,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        categoryId: json["category_id"],
        providerId: json["provider_id"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
        gallaryPhoto: json["gallary_photo"] == null
            ? []
            : List<String>.from(json["gallary_photo"]!.map((x) => x)),
        serviceDuration: json["service_duration"],
        salonServiceCharge: json["salon_service_charge"],
        homeServiceCharge: json["home_service_charge"],
        setBookingMony: json["set_booking_mony"],
        availableServiceOur: json["available_service_our"] == null
            ? []
            : List<AvailableServiceOur>.from(json["available_service_our"]!
                .map((x) => AvailableServiceOur.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "provider_id": providerId,
        "service_name": serviceName,
        "service_description": serviceDescription,
        "gallary_photo": gallaryPhoto == null
            ? []
            : List<dynamic>.from(gallaryPhoto!.map((x) => x)),
        "service_duration": serviceDuration,
        "salon_service_charge": salonServiceCharge,
        "home_service_charge": homeServiceCharge,
        "set_booking_mony": setBookingMony,
        "available_service_our": availableServiceOur == null
            ? []
            : List<dynamic>.from(availableServiceOur!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class AvailableServiceOur {
  String? day;
  String? startTime;
  String? endTime;

  AvailableServiceOur({this.day, this.startTime, this.endTime});

  AvailableServiceOur.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    startTime = json['Start Time'];
    endTime = json['End Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Day'] = day;
    data['Start Time'] = startTime;
    data['End Time'] = endTime;
    return data;
  }
}
