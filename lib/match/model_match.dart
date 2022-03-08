
import 'dart:convert';

List<ModelMatch> modelMatchFromJson(String str) => List<ModelMatch>.from(json.decode(str).map((x) => ModelMatch.fromJson(x)));

String modelMatchToJson(List<ModelMatch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelMatch {
  ModelMatch({
    this.matchId,
    this.team1,
    this.team2,
    this.matchType,
    this.dateTime,
    this.description,
    this.status,
  });

  String? matchId;
  String? team1;
  String? team2;
  String? matchType;
  dynamic? dateTime;
  String? description;
  String? status;

  factory ModelMatch.fromJson(Map<String, dynamic> json) => ModelMatch(
    matchId: json["match_id"],
    team1: json["team1"],
    team2: json["team2"],
    matchType: json["match_type"],
    dateTime: json["date_time"],
    description: json["description"] == null ? null : json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "match_id": matchId,
    "team1": team1,
    "team2": team2,
    "match_type": matchType,
    "date_time": dateTime,
    "description": description == null ? null : description,
    "status": status,
  };
}
