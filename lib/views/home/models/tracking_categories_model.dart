import 'dart:convert';

TrackingCategoriesModel trackingCategoriesModelFromMap(String str) =>
    TrackingCategoriesModel.fromMap(json.decode(str));

String trackingCategoriesModelToMap(TrackingCategoriesModel data) =>
    json.encode(data.toMap());

class TrackingCategoriesModel {
  TrackingCategoriesModel({
    required this.id,
    required this.label,
    required this.unit,
    required this.type,
    required this.link,
    required this.hexCode,
    this.order = 0,
  });
  final String id;
  final String label;
  final String unit;
  final String type;
  final String link;
  final String hexCode;
  final int order;

  factory TrackingCategoriesModel.fromMap(Map<String, dynamic> json) =>
      TrackingCategoriesModel(
        id: json["id"],
        label: json["label"],
        unit: json["unit"],
        type: json["type"],
        link: json["link"],
        hexCode: json["hexCode"],
        order: json['order'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "unit": unit,
        "type": type,
        "link": link,
        "hexCode": hexCode,
        "order": order,
      };
}
