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
  String? description;
  String? inningType;
  String? winningOver;
  String? overScore;
  String? status;
  String? team1;
  String? team2;
  String? matchType;
  List<JoinList>? joinList;

  factory ModelOver.fromJson(Map<String, dynamic> json) => ModelOver(
    lessRunPerOverContestId: json["less_run_per_over_contest_id"],
    userId: json["user_id"],
    matchId: json["match_id"],
    contestName: json["contest_name"],
    entryFee: json["entry_fee"],
    winningAmount: json["winning_amount"],
    description: json["description"],
    inningType: json["inning_type"],
    winningOver: json["winning_over"] == null ? null : json["winning_over"],
    overScore: json["over_score"] == null ? null : json["over_score"],
    status: json["status"],
    team1: json["team1"],
    team2: json["team2"],
    matchType: json["match_type"],
    joinList: List<JoinList>.from(json["join_list"].map((x) => JoinList.fromJson(x))),
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
    "winning_over": winningOver == null ? null : winningOver,
    "over_score": overScore == null ? null : overScore,
    "status": status,
    "team1": team1,
    "team2": team2,
    "match_type": matchType,
    "join_list": List<dynamic>.from(joinList!.map((x) => x.toJson())),
  };
}

class JoinList {
  JoinList({
    this.userId,
    this.userSelectedOver,
    this.name,
  });

  String? userId;
  String? userSelectedOver;
  String? name;

  factory JoinList.fromJson(Map<String, dynamic> json) => JoinList(
    userId: json["user_id"],
    userSelectedOver: json["user_selected_over"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_selected_over": userSelectedOver,
    "name": name,
  };
}



