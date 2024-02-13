// To parse this JSON data, do
//
//     final catalougeListModel = catalougeListModelFromJson(jsonString);

import 'dart:convert';

CatalougeListModel catalougeListModelFromJson(String str) => CatalougeListModel.fromJson(json.decode(str));

String catalougeListModelToJson(CatalougeListModel data) => json.encode(data.toJson());

class CatalougeListModel {
    String? status;
    List<Provider>? provider;

    CatalougeListModel({
        this.status,
        this.provider,
    });

    factory CatalougeListModel.fromJson(Map<String, dynamic> json) => CatalougeListModel(
        status: json["status"],
        provider: json["provider"] == null ? [] : List<Provider>.from(json["provider"]!.map((x) => Provider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "provider": provider == null ? [] : List<dynamic>.from(provider!.map((x) => x.toJson())),
    };
}

class Provider {
    int? id;
    int? providerId;
    int? serviceId;
    String? catalogName;
    String? catalogDescription;
    List<String>? image;
    String? serviceDuration;
    String? salonServiceCharge;
    String? homeServiceCharge;
    String? bookingMoney;
    List<ServiceHour>? serviceHour;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic salonDetails;

    Provider({
        this.id,
        this.providerId,
        this.serviceId,
        this.catalogName,
        this.catalogDescription,
        this.image,
        this.serviceDuration,
        this.salonServiceCharge,
        this.homeServiceCharge,
        this.bookingMoney,
        this.serviceHour,
        this.createdAt,
        this.updatedAt,
        this.salonDetails,
    });

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        providerId: json["provider_id"],
        serviceId: json["service_id"],
        catalogName: json["catalog_name"],
        catalogDescription: json["catalog_description"],
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
        serviceDuration: json["service_duration"],
        salonServiceCharge: json["salon_service_charge"],
        homeServiceCharge: json["home_service_charge"],
        bookingMoney: json["booking_money"],
        serviceHour: json["service_hour"] == null ? [] : List<ServiceHour>.from(json["service_hour"]!.map((x) => ServiceHour.fromJson(x))),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        salonDetails: json["salon_details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "provider_id": providerId,
        "service_id": serviceId,
        "catalog_name": catalogName,
        "catalog_description": catalogDescription,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "service_duration": serviceDuration,
        "salon_service_charge": salonServiceCharge,
        "home_service_charge": homeServiceCharge,
        "booking_money": bookingMoney,
        "service_hour": serviceHour == null ? [] : List<dynamic>.from(serviceHour!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "salon_details": salonDetails,
    };
}

class ServiceHour {
    String? day;
    String? startTime;
    String? endTime;

    ServiceHour({
        this.day,
        this.startTime,
        this.endTime,
    });

    factory ServiceHour.fromJson(Map<String, dynamic> json) => ServiceHour(
        day: json["Day"],
        startTime: json["Start Time"],
        endTime: json["End Time"],
    );

    Map<String, dynamic> toJson() => {
        "Day": day,
        "Start Time": startTime,
        "End Time": endTime,
    };
}
