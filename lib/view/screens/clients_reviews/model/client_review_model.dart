// To parse this JSON data, do
//
//     final clientReviewModel = clientReviewModelFromJson(jsonString);

import 'dart:convert';

ClientReviewModel clientReviewModelFromJson(String str) =>
    ClientReviewModel.fromJson(json.decode(str));

String clientReviewModelToJson(ClientReviewModel data) =>
    json.encode(data.toJson());

class ClientReviewModel {
  String? message;
  int? totalReview;
  double? averageRating;
  ServiceDetailsWithUser? serviceDetailsWithUser;

  ClientReviewModel({
    this.message,
    this.totalReview,
    this.averageRating,
    this.serviceDetailsWithUser,
  });

  factory ClientReviewModel.fromJson(Map<String, dynamic> json) =>
      ClientReviewModel(
        message: json["message"],
        totalReview: json["total_review"],
        averageRating: json["average_rating"]?.toDouble(),
        serviceDetailsWithUser: json["service_details_with_user"] == null
            ? null
            : ServiceDetailsWithUser.fromJson(
                json["service_details_with_user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "total_review": totalReview,
        "average_rating": averageRating,
        "service_details_with_user": serviceDetailsWithUser?.toJson(),
      };
}

class ServiceDetailsWithUser {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  ServiceDetailsWithUser({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ServiceDetailsWithUser.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsWithUser(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int? id;
  int? userId;
  int? serviceId;
  int? providerId;
  dynamic catalogueId;
  String? review;
  int? rating;
  int? status;
  String? createdAt;
  DateTime? updatedAt;
  User? user;

  Datum({
    this.id,
    this.userId,
    this.serviceId,
    this.providerId,
    this.catalogueId,
    this.review,
    this.rating,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        providerId: json["provider_id"],
        catalogueId: json["catalogue_id"],
        review: json["review"],
        rating: json["rating"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "provider_id": providerId,
        "catalogue_id": catalogueId,
        "review": review,
        "rating": rating,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? name;
  String? image;

  User({
    this.id,
    this.name,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
