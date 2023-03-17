// To parse this JSON data, do
//
//     final modelDashboard = modelDashboardFromJson(jsonString);

import 'dart:convert';

ModelDashboard modelDashboardFromJson(String str) => ModelDashboard.fromJson(json.decode(str));

String modelDashboardToJson(ModelDashboard data) => json.encode(data.toJson());

class ModelDashboard {
  ModelDashboard({
    this.ldc,
    this.toss,
    this.lrpo,
    this.match,
    this.profit,
  });

  int? ldc;
  int? toss;
  int? lrpo;
  int? match;
  int? profit;

  factory ModelDashboard.fromJson(Map<String, dynamic> json) => ModelDashboard(
    ldc: json["ldc"],
    toss: json["toss"],
    lrpo: json["lrpo"],
    match: json["match"],
    profit: json["profit"]
  );

  Map<String, dynamic> toJson() => {
    "ldc": ldc,
    "toss": toss,
    "lrpo": lrpo,
    "match": match,
    "profit":profit,
  };
}
