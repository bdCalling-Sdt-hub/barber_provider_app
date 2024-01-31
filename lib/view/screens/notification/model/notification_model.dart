import 'dart:convert';

class NotificationModel {
  String? status;
  List<Notification>? notifications;

  NotificationModel({
    this.status,
    this.notifications,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        notifications: json["notifications"] == null
            ? []
            : List<Notification>.from(
                json["notifications"]!.map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "notifications": notifications == null
            ? []
            : List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class Notification {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Notification({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromRawJson(String str) =>
      Notification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
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
  User? user;

  Data({
    this.message,
    this.user,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
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
  dynamic address;
  String? createdAt;
  DateTime? updatedAt;
  dynamic googleId;
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
    this.createdAt,
    this.updatedAt,
    this.googleId,
    this.deletedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
        createdAt: json["created_at"] == null ? null : "",
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        googleId: json["google_id"],
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
        "created_at": createdAt ?? "",
        "updated_at": updatedAt?.toIso8601String(),
        "google_id": googleId,
        "deleted_at": deletedAt,
      };
}
