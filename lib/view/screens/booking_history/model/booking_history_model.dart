// To parse this JSON data, do
//
//     final bookingHistory = bookingHistoryFromJson(jsonString);

import 'dart:convert';

BookingHistory bookingHistoryFromJson(String str) =>
    BookingHistory.fromJson(json.decode(str));

String bookingHistoryToJson(BookingHistory data) => json.encode(data.toJson());

class BookingHistory {
  List<Datum>? data;
  Pagination? pagination;

  BookingHistory({
    this.data,
    this.pagination,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Datum {
  Booking? booking;
  Service? service;
  List<CatalogDetail>? catalogDetails;

  Datum({
    this.booking,
    this.service,
    this.catalogDetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        booking:
            json["booking"] == null ? null : Booking.fromJson(json["booking"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
        catalogDetails: json["catalog_details"] == null
            ? []
            : List<CatalogDetail>.from(
                json["catalog_details"]!.map((x) => CatalogDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "booking": booking?.toJson(),
        "service": service?.toJson(),
        "catalog_details": catalogDetails == null
            ? []
            : List<dynamic>.from(catalogDetails!.map((x) => x.toJson())),
      };
}

class Booking {
  int? id;
  int? userId;
  int? providerId;
  String? service;
  dynamic catalougeId;
  String? serviceType;
  String? serviceDuration;
  String? price;
  String? date;
  String? time;
  int? status;
  int? advanceMoney;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Booking({
    this.id,
    this.userId,
    this.providerId,
    this.service,
    this.catalougeId,
    this.serviceType,
    this.serviceDuration,
    this.price,
    this.date,
    this.time,
    this.status,
    this.advanceMoney,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        userId: json["user_id"],
        providerId: json["provider_id"],
        service: json["service"],
        catalougeId: json["catalouge_id"],
        serviceType: json["service_type"],
        serviceDuration: json["service_duration"],
        price: json["price"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
        advanceMoney: json["advance_money"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "provider_id": providerId,
        "service": service,
        "catalouge_id": catalougeId,
        "service_type": serviceType,
        "service_duration": serviceDuration,
        "price": price,
        "date": date,
        "time": time,
        "status": status,
        "advance_money": advanceMoney,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? isVerified;
  String? image;
  String? latitude;
  String? longitude;
  String? userType;
  String? userStatus;
  String? phoneNumber;
  String? address;
  String? googleId;
  dynamic facebookId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isVerified,
    this.image,
    this.latitude,
    this.longitude,
    this.userType,
    this.userStatus,
    this.phoneNumber,
    this.address,
    this.googleId,
    this.facebookId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        isVerified: json["is_verified"],
        image: json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        userType: json["user_type"],
        userStatus: json["user_status"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        googleId: json["google_id"],
        facebookId: json["facebook_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "is_verified": isVerified,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "user_type": userType,
        "user_status": userStatus,
        "phone_number": phoneNumber,
        "address": address,
        "google_id": googleId,
        "facebook_id": facebookId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class CatalogDetail {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  String? image;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? bookingMoney;
  String? serviceHour;
  DateTime? createdAt;
  DateTime? updatedAt;

  CatalogDetail({
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
  });

  factory CatalogDetail.fromJson(Map<String, dynamic> json) => CatalogDetail(
        id: json["id"],
        providerId: json["provider_id"],
        serviceId: json["service_id"],
        catalogName: json["catalog_name"],
        catalogDescription: json["catalog_description"],
        image: json["image"],
        serviceDuration: json["service_duration"],
        salonServiceCharge: json["salon_service_charge"],
        homeServiceCharge: json["home_service_charge"],
        bookingMoney: json["booking_money"],
        serviceHour: json["service_hour"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "provider_id": providerId,
        "service_id": serviceId,
        "catalog_name": catalogName,
        "catalog_description": catalogDescription,
        "image": image,
        "service_duration": serviceDuration,
        "salon_service_charge": salonServiceCharge,
        "home_service_charge": homeServiceCharge,
        "booking_money": bookingMoney,
        "service_hour": serviceHour,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Service {
  int? serviceId;
  int? catalougeId;

  Service({
    this.serviceId,
    this.catalougeId,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json["service_id"],
        catalougeId: json["catalouge_id"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "catalouge_id": catalougeId,
      };
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? total;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        perPage: json["per_page"],
        total: json["total"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "total_pages": totalPages,
        "per_page": perPage,
        "total": total,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
      };
}
