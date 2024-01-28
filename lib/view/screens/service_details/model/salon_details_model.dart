import 'dart:convert';

class ServiceDetailsModel {
  String? message;
  int? review;
  int? rating;
  ServiceDetails? serviceDetails;

  ServiceDetailsModel({
    this.message,
    this.review,
    this.rating,
    this.serviceDetails,
  });

  factory ServiceDetailsModel.fromRawJson(String str) =>
      ServiceDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsModel(
        message: json["message"],
        review: json["review"],
        rating: json["rating"],
        serviceDetails: json["service_details"] == null
            ? null
            : ServiceDetails.fromJson(json["service_details"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "review": review,
        "rating": rating,
        "service_details": serviceDetails?.toJson(),
      };
}

class ServiceDetails {
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
  List<AvailableServiceOurServiceDetails>? availableServiceOur;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? serviceRating;

  ServiceDetails({
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
    this.serviceRating,
  });

  factory ServiceDetails.fromRawJson(String str) =>
      ServiceDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
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
            : List<AvailableServiceOurServiceDetails>.from(
                json["available_service_our"]!
                    .map((x) => AvailableServiceOurServiceDetails.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        serviceRating: json["service_rating"] == null
            ? []
            : List<dynamic>.from(json["service_rating"]!.map((x) => x)),
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
        "service_rating": serviceRating == null
            ? []
            : List<dynamic>.from(serviceRating!.map((x) => x)),
      };
}

class AvailableServiceOurServiceDetails {
  String? day;
  String? startTime;
  String? endTime;

  AvailableServiceOurServiceDetails({this.day, this.startTime, this.endTime});

  AvailableServiceOurServiceDetails.fromJson(Map<String, dynamic> json) {
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
