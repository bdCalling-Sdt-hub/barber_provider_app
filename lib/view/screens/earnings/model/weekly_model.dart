// To parse this JSON data, do
//
//     final weeklyModel = weeklyModelFromJson(jsonString);

import 'dart:convert';

WeeklyModel weeklyModelFromJson(String str) =>
    WeeklyModel.fromJson(json.decode(str));

String weeklyModelToJson(WeeklyModel data) => json.encode(data.toJson());

class WeeklyModel {
  String? status;
  List<WeekEarning>? weekEarning;
  WeeklyData? data;

  WeeklyModel({
    this.status,
    this.weekEarning,
    this.data,
  });

  factory WeeklyModel.fromJson(Map<String, dynamic> json) => WeeklyModel(
        status: json["status"],
        weekEarning: json["week_earning"] == null
            ? []
            : List<WeekEarning>.from(
                json["week_earning"]!.map((x) => WeekEarning.fromJson(x))),
        data: json["data"] == null ? null : WeeklyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "week_earning": weekEarning == null
            ? []
            : List<dynamic>.from(weekEarning!.map((x) => x.toJson())),
        "data": data?.toJson().runtimeType,
      };
}

// "data": data?.toJson().runtimeType,

class WeeklyData {
  Headers? headers;
  Original? original;
  dynamic exception;

  WeeklyData({
    this.headers,
    this.original,
    this.exception,
  });

  factory WeeklyData.fromJson(Map<String, dynamic> json) => WeeklyData(
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
  int? totalEarning;
  List<DailyEarning>? dailyEarning;
  int? totalWeekEarning;
  int? totalMonthEarning;
  int? totalYearlyEarning;

  Original({
    this.totalEarning,
    this.dailyEarning,
    this.totalWeekEarning,
    this.totalMonthEarning,
    this.totalYearlyEarning,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        totalEarning: json["total_earning"],
        dailyEarning: json["daily_earning"] == null
            ? []
            : List<DailyEarning>.from(
                json["daily_earning"]!.map((x) => DailyEarning.fromJson(x))),
        totalWeekEarning: json["total_week_earning"],
        totalMonthEarning: json["total_month_earning"],
        totalYearlyEarning: json["total_yearly_earning"],
      );

  Map<String, dynamic> toJson() => {
        "total_earning": totalEarning,
        "daily_earning": dailyEarning == null
            ? []
            : List<dynamic>.from(dailyEarning!.map((x) => x.toJson())),
        "total_week_earning": totalWeekEarning,
        "total_month_earning": totalMonthEarning,
        "total_yearly_earning": totalYearlyEarning,
      };
}

class DailyEarning {
  dynamic totalAmount;

  DailyEarning({
    this.totalAmount,
  });

  factory DailyEarning.fromJson(Map<String, dynamic> json) => DailyEarning(
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
      };
}

class WeekEarning {
  int? totalAmount;
  dynamic eventName;

  WeekEarning({
    this.totalAmount,
    this.eventName,
  });

  factory WeekEarning.fromJson(Map<String, dynamic> json) => WeekEarning(
        totalAmount: json["total_amount"] ?? json["count"],
        eventName: json["Dayname"] ?? json["month_name"] ?? json["year"],
      );

  Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "Dayname": eventName,
      };
}
