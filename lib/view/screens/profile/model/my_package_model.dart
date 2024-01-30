import 'dart:convert';

class MyPackage {
  String? message;
  List<Datum>? data;

  MyPackage({
    this.message,
    this.data,
  });

  factory MyPackage.fromRawJson(String str) =>
      MyPackage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyPackage.fromJson(Map<String, dynamic> json) => MyPackage(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? subscriptionId;
  int? userId;
  dynamic otherSubscriptionData;
  Package? package;

  Datum({
    this.subscriptionId,
    this.userId,
    this.otherSubscriptionData,
    this.package,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subscriptionId: json["subscription_id"],
        userId: json["user_id"],
        otherSubscriptionData: json["other_subscription_data"],
        package:
            json["package"] == null ? null : Package.fromJson(json["package"]),
      );

  Map<String, dynamic> toJson() => {
        "subscription_id": subscriptionId,
        "user_id": userId,
        "other_subscription_data": otherSubscriptionData,
        "package": package?.toJson(),
      };
}

class Package {
  int? packageId;
  String? packageName;
  String? packageDuration;
  List<String>? packageFeatures;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  Package({
    this.packageId,
    this.packageName,
    this.packageDuration,
    this.packageFeatures,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromRawJson(String str) => Package.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        packageId: json["package_id"],
        packageName: json["package_name"],
        packageDuration: json["package_duration"],
        packageFeatures: json["package_features"] == null
            ? []
            : List<String>.from(json["package_features"]!.map((x) => x)),
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "package_name": packageName,
        "package_duration": packageDuration,
        "package_features": packageFeatures == null
            ? []
            : List<dynamic>.from(packageFeatures!.map((x) => x)),
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
