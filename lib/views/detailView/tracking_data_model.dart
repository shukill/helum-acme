import 'dart:convert';

TarckingDataModel tarckingDataModelFromMap(String str) =>
    TarckingDataModel.fromMap(json.decode(str));

String tarckingDataModelToMap(TarckingDataModel data) =>
    json.encode(data.toMap());

class TarckingDataModel {
  TarckingDataModel({
    required this.id,
    required this.value,
    required this.uploadedTime,
    required this.updatedTime,
  });

  final String id;
  final String value;
  final DateTime uploadedTime;
  final DateTime updatedTime;

  factory TarckingDataModel.fromMap(Map<String, dynamic> json) =>
      TarckingDataModel(
        id: json["id"],
        value: json["value"],
        uploadedTime: DateTime.parse(json["uploadedTime"]),
        updatedTime: DateTime.parse(json["updatedTime"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
        "uploadedTime": uploadedTime.toIso8601String(),
        "updatedTime": updatedTime.toIso8601String(),
      };
}
