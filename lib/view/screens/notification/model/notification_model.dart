// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  String? status;
  List<MyNotification>? notification;
  AccountSetup? accountSetup;

  NotificationModel({
    this.status,
    this.notification,
    this.accountSetup,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        notification: json["notification"] == null
            ? []
            : List<MyNotification>.from(
                json["notification"]!.map((x) => MyNotification.fromJson(x))),
        accountSetup: json["account_setup"] == null
            ? null
            : AccountSetup.fromJson(json["account_setup"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "notification": notification == null
            ? []
            : List<dynamic>.from(notification!.map((x) => x.toJson())),
        "account_setup": accountSetup?.toJson(),
      };
}

class AccountSetup {
  Headers? headers;
  Original? original;
  dynamic exception;

  AccountSetup({
    this.headers,
    this.original,
    this.exception,
  });

  factory AccountSetup.fromJson(Map<String, dynamic> json) => AccountSetup(
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null
            ? null
            : Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers?.toJson(),
        "original": original?.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  String? status;
  List<dynamic>? notifications;

  Original({
    this.status,
    this.notifications,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        status: json["status"],
        notifications: json["notifications"] == null
            ? []
            : List<dynamic>.from(json["notifications"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "notifications": notifications == null
            ? []
            : List<dynamic>.from(notifications!.map((x) => x)),
      };
}

class MyNotification {
  String? id;
  Data? data;

  MyNotification({
    this.id,
    this.data,
  });

  factory MyNotification.fromJson(Map<String, dynamic> json) => MyNotification(
        id: json["id"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "data": data?.toJson(),
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
  int? userId;
  int? providerId;
  String? service;
  dynamic catalougeId;
  String? serviceType;
  String? serviceDuration;
  String? price;
  String? date;
  String? time;
  dynamic status;
  dynamic advanceMoney;
  String? createdAt;
  String? updatedAt;

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
