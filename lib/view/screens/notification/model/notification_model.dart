// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  String? message;
  List<MyNotification>? notifications;

  NotificationModel({
    this.message,
    this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        message: json["message"],
        notifications: json["notifications"] == null
            ? []
            : List<MyNotification>.from(
                json["notifications"]!.map((x) => MyNotification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "notifications": notifications == null
            ? []
            : List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class MyNotification {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  MyNotification({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory MyNotification.fromJson(Map<String, dynamic> json) => MyNotification(
        id: json["id"],
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data?.toJson(),
        "read_at": readAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Data {
  String? message;
  String? description;
  User? user;

  Data({
    this.message,
    this.description,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        description: json["description"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "description": description,
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
  dynamic latitude;
  dynamic longitude;
  String? userType;
  String? userStatus;
  String? phoneNumber;
  dynamic address;
  dynamic googleId;
  dynamic facebookId;
  String? createdAt;
  String? updatedAt;
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
