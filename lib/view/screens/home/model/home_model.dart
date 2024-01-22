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
  List<String>? gallaryPhoto;
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
        gallaryPhoto: json["gallary_photo"] == null
            ? []
            : List<String>.from(json["gallary_photo"]!.map((x) => x)),
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
        "gallary_photo": gallaryPhoto == null
            ? []
            : List<dynamic>.from(gallaryPhoto!.map((x) => x)),
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

enum Day { FRI, MON, SAT, SUN, THU, TUE, WED }

final dayValues = EnumValues({
  "Fri": Day.FRI,
  "Mon": Day.MON,
  "Sat": Day.SAT,
  "Sun": Day.SUN,
  "Thu": Day.THU,
  "Tue": Day.TUE,
  "Wed": Day.WED
});

enum Time { THE_1036, THE_1438 }

final timeValues = EnumValues({"10:36": Time.THE_1036, "14:38": Time.THE_1438});

class SalonDetail {
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
