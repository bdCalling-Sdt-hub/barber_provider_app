import 'dart:convert';

class CategoryModel {
  String? status;
  List<Message>? message;

  CategoryModel({
    this.status,
    this.message,
  });

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  Message({
    this.id,
    this.categoryName,
    this.categoryImage,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
      };
}
