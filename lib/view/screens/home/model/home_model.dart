import 'dart:convert';

class HomeModel {
  String? status;
  List<Provider>? provider;

  HomeModel({
    this.status,
    this.provider,
  });

  factory HomeModel.fromRawJson(String str) =>
      HomeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        provider: json["provider"] == null
            ? []
            : List<Provider>.from(
                json["provider"]!.map((x) => Provider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "provider": provider == null
            ? []
            : List<dynamic>.from(provider!.map((x) => x.toJson())),
      };
}

class Provider {
  int? id;
  int? userId;
  int? categoryId;
  String? businessName;
  String? address;
  String? description;
  List<AvailableServiceOur>? availableServiceOur;
  String? coverPhoto;
  String? gallaryPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? latitude;
  String? longitude;
  List<SalonDetail>? salonDetails;

  Provider({
    this.id,
    this.userId,
    this.categoryId,
    this.businessName,
    this.address,
    this.description,
    this.availableServiceOur,
    this.coverPhoto,
    this.gallaryPhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.salonDetails,
  });

  factory Provider.fromRawJson(String str) =>
      Provider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        businessName: json["business_name"],
        address: json["address"],
        description: json["description"],
        availableServiceOur: json["available_service_our"] == null
            ? []
            : List<AvailableServiceOur>.from(json["available_service_our"]!
                .map((x) => AvailableServiceOur.fromJson(x))),
        coverPhoto: json["cover_photo"],
        gallaryPhoto: json["gallary_photo"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        salonDetails: json["salon_details"] == null
            ? []
            : List<SalonDetail>.from(
                json["salon_details"]!.map((x) => SalonDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "business_name": businessName,
        "address": address,
        "description": description,
        "available_service_our": availableServiceOur == null
            ? []
            : List<dynamic>.from(availableServiceOur!.map((x) => x.toJson())),
        "cover_photo": coverPhoto,
        "gallary_photo": gallaryPhoto,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "salon_details": salonDetails == null
            ? []
            : List<dynamic>.from(salonDetails!.map((x) => x.toJson())),
      };
}

class AvailableServiceOur {
  String? day;
  Time? startTime;
  Time? endTime;

  AvailableServiceOur({
    this.day,
    this.startTime,
    this.endTime,
  });

  factory AvailableServiceOur.fromRawJson(String str) =>
      AvailableServiceOur.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailableServiceOur.fromJson(Map<String, dynamic> json) =>
      AvailableServiceOur(
        day: json["Day"],
        startTime: timeValues.map[json["Start Time"]]!,
        endTime: timeValues.map[json["End Time"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Day": day,
        "Start Time": timeValues.reverse[startTime],
        "End Time": timeValues.reverse[endTime],
      };
}

enum Time { THE_1403, THE_1456 }

final timeValues = EnumValues({"14:03": Time.THE_1403, "14:56": Time.THE_1456});

class SalonDetail {
  int? id;
  int? categoryId;
  int? providerId;
  String? serviceName;
  String? serviceDescription;
  String? gallaryPhoto;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? setBookingMony;
  String? availableServiceOur;
  DateTime? createdAt;
  DateTime? updatedAt;

  SalonDetail({
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

  factory SalonDetail.fromRawJson(String str) =>
      SalonDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalonDetail.fromJson(Map<String, dynamic> json) => SalonDetail(
        id: json["id"],
        categoryId: json["category_id"],
        providerId: json["provider_id"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
        gallaryPhoto: json["gallary_photo"],
        serviceDuration: json["service_duration"],
        salonServiceCharge: json["salon_service_charge"],
        homeServiceCharge: json["home_service_charge"],
        setBookingMony: json["set_booking_mony"],
        availableServiceOur: json["available_service_our"],
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
        "gallary_photo": gallaryPhoto,
        "service_duration": serviceDuration,
        "salon_service_charge": salonServiceCharge,
        "home_service_charge": homeServiceCharge,
        "set_booking_mony": setBookingMony,
        "available_service_our": availableServiceOur,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
