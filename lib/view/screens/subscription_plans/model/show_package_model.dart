import 'dart:convert';

class PackageListModel {
  String? message;
  List<Datum>? data;

  PackageListModel({
    this.message,
    this.data,
  });

  factory PackageListModel.fromRawJson(String str) =>
      PackageListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PackageListModel.fromJson(Map<String, dynamic> json) =>
      PackageListModel(
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
  int? id;
  String? packageName;
  String? packageDuration;
  List<String>? packageFeatures;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.packageName,
    this.packageDuration,
    this.packageFeatures,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
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
        "id": id,
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
