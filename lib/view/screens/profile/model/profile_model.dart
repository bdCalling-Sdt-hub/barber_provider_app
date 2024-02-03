import 'dart:convert';

class ProfileModel {
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
  DateTime? createdAt;
  DateTime? updatedAt;
  String? googleId;
  dynamic facebookId;
  dynamic deletedAt;

  ProfileModel({
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
    this.facebookId,
    this.deletedAt,
  });

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        googleId: json["google_id"],
        facebookId: json["facebook_id"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "google_id": googleId,
        "facebook_id": facebookId,
        "deleted_at": deletedAt,
      };
}
