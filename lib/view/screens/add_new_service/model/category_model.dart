// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String? status;
  List<Message>? message;

  CategoryModel({
    this.status,
    this.message,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
  String? categoryName;
  String? categoryImage;
  dynamic createdAt;
  dynamic updatedAt;

  Message({
    this.id,
    this.categoryName,
    this.categoryImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
