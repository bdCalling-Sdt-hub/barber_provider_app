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
  String? serviceType;
  String? serviceDuration;
  String? price;
  String? date;
  String? time;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Booking({
    this.id,
    this.userId,
    this.providerId,
    this.service,
    this.serviceType,
    this.serviceDuration,
    this.price,
    this.date,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        userId: json["user_id"],
        providerId: json["provider_id"],
        service: json["service"],
        serviceType: json["service_type"]!,
        serviceDuration: json["service_duration"],
        price: json["price"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
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
        "service_type": serviceType,
        "service_duration": serviceDuration,
        "price": price,
        "date": date,
        "time": time,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  Name? name;
  Email? email;
  dynamic emailVerifiedAt;
  int? isVerified;
  UserImage? image;
  String? latitude;
  String? longitude;
  UserType? userType;
  String? userStatus;
  String? phoneNumber;
  Address? address;
  dynamic googleId;
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
        name: nameValues.map[json["name"]]!,
        email: emailValues.map[json["email"]]!,
        emailVerifiedAt: json["email_verified_at"],
        isVerified: json["is_verified"],
        image: userImageValues.map[json["image"]]!,
        latitude: json["latitude"],
        longitude: json["longitude"],
        userType: userTypeValues.map[json["user_type"]]!,
        userStatus: json["user_status"],
        phoneNumber: json["phone_number"],
        address: addressValues.map[json["address"]]!,
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
        "name": nameValues.reverse[name],
        "email": emailValues.reverse[email],
        "email_verified_at": emailVerifiedAt,
        "is_verified": isVerified,
        "image": userImageValues.reverse[image],
        "latitude": latitude,
        "longitude": longitude,
        "user_type": userTypeValues.reverse[userType],
        "user_status": userStatus,
        "phone_number": phoneNumber,
        "address": addressValues.reverse[address],
        "google_id": googleId,
        "facebook_id": facebookId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

enum Address { DHAKA }

final addressValues = EnumValues({"dhaka": Address.DHAKA});

enum Email { SOKOREY431_GIRATEX_COM }

final emailValues =
    EnumValues({"sokorey431@giratex.com": Email.SOKOREY431_GIRATEX_COM});

enum UserImage { DUMMY_IMG_DEFAULT_JPG }

final userImageValues =
    EnumValues({"dummyImg/default.jpg": UserImage.DUMMY_IMG_DEFAULT_JPG});

enum Name { NADIM_HASAN }

final nameValues = EnumValues({"Nadim hasan": Name.NADIM_HASAN});

enum UserType { USER }

final userTypeValues = EnumValues({"user": UserType.USER});

class CatalogDetail {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  CatalogDetailImage? image;
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
        catalogName: json["catalog_name"]!,
        catalogDescription: json["catalog_description"],
        image: catalogDetailImageValues.map[json["image"]]!,
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
        "image": catalogDetailImageValues.reverse[image],
        "service_duration": serviceDuration,
        "salon_service_charge": salonServiceCharge,
        "home_service_charge": homeServiceCharge,
        "booking_money": bookingMoney,
        "service_hour": serviceHour,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum CatalogDetailImage {
  IMAGES_1707129035_DOWNLOAD_2_JPG,
  IMAGES_1707129846_IMAGES_15_JPG
}

final catalogDetailImageValues = EnumValues({
  "[\"images\\/1707129035.download (2).jpg\"]":
      CatalogDetailImage.IMAGES_1707129035_DOWNLOAD_2_JPG,
  "[\"images\\/1707129846.images (15).jpg\"]":
      CatalogDetailImage.IMAGES_1707129846_IMAGES_15_JPG
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
