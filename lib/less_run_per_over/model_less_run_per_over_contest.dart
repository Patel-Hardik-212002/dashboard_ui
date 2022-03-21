// To parse this JSON data, do
//
//     final modelOver = modelOverFromJson(jsonString);

import 'dart:convert';

List<ModelOver> modelOverFromJson(String str) => List<ModelOver>.from(json.decode(str).map((x) => ModelOver.fromJson(x)));

String modelOverToJson(List<ModelOver> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelOver {
  ModelOver({
    this.lessRunPerOverContestId,
    this.userId,
    this.matchId,
    this.contestName,
    this.entryFee,
    this.winningAmount,
    this.description,
    this.inningType,
    this.winningOver,
    this.overScore,
    this.status,
    this.team1,
    this.team2,
    this.matchType,
    this.joinList,
  });

  String? lessRunPerOverContestId;
  String? userId;
  String? matchId;
  String? contestName;
  String? entryFee;
  String? winningAmount;
  String?description;
  String? inningType;
  dynamic? winningOver;
  dynamic? overScore;
  String? status;
  String? team1;
  String? team2;
  String? matchType;
  List<dynamic>? joinList;

  factory ModelOver.fromJson(Map<String, dynamic> json) => ModelOver(
    lessRunPerOverContestId: json["less_run_per_over_contest_id"],
    userId: json["user_id"],
    matchId: json["match_id"],
    contestName: json["contest_name"],
    entryFee: json["entry_fee"],
    winningAmount: json["winning_amount"],
    description: json["description"],
    inningType: json["inning_type"],
    winningOver: json["winning_over"],
    overScore: json["over_score"],
    status: json["status"],
    team1: json["team1"],
    team2: json["team2"],
    matchType: json["match_type"],
    joinList: List<dynamic>.from(json["join_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "less_run_per_over_contest_id": lessRunPerOverContestId,
    "user_id": userId,
    "match_id": matchId,
    "contest_name": contestName,
    "entry_fee": entryFee,
    "winning_amount": winningAmount,
    "description": description,
    "inning_type": inningType,
    "winning_over": winningOver,
    "over_score": overScore,
    "status": status,
    "team1": team1,
    "team2": team2,
    "match_type": matchType,
    "join_list": List<dynamic>.from(joinList!.map((x) => x)),
  };
}
