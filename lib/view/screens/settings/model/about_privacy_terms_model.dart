import 'dart:convert';

class AboutPrivacyTermsModel {
  String? status;
  List<Message>? message;

  AboutPrivacyTermsModel({
    this.status,
    this.message,
  });

  factory AboutPrivacyTermsModel.fromRawJson(String str) =>
      AboutPrivacyTermsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutPrivacyTermsModel.fromJson(Map<String, dynamic> json) =>
      AboutPrivacyTermsModel(
        status: json["status"],
        message: json["message"] == null
            ? []
            : List<Message>.from(
                json["message"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null
            ? []
            : List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class Message {
  int? id;
  String? pageTitle;
  String? pageDescription;
  DateTime? createdAt;
  DateTime? updatedAt;

  Message({
    this.id,
    this.pageTitle,
    this.pageDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        pageTitle: json["page_title"],
        pageDescription: json["page_description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page_title": pageTitle,
        "page_description": pageDescription,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
