// To parse this JSON data, do
//
//     final modelToss = modelTossFromJson(jsonString);

import 'dart:convert';

List<ModelToss> modelTossFromJson(String str) => List<ModelToss>.from(json.decode(str).map((x) => ModelToss.fromJson(x)));

String modelTossToJson(List<ModelToss> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelToss {
  ModelToss({
    this.tossWinnerContestId,
    this.userId,
    this.matchId,
    this.contestName,
    this.entryFee,
    this.winingAmount,
    this.description,
    this.tossResult,
    this.team1,
    this.team2,
    this.matchType,
    this.joinList,
  });

  String? tossWinnerContestId;
  String? userId;
  String? matchId;
  String? contestName;
  String? entryFee;
  String? winingAmount;
  String? description;
  dynamic? tossResult;
  String? team1;
  String? team2;
  String? matchType;
  List<JoinList>? joinList;

  factory ModelToss.fromJson(Map<String, dynamic> json) => ModelToss(
    tossWinnerContestId: json["toss_winner_contest_id"],
    userId: json["user_id"],
    matchId: json["match_id"],
    contestName: json["contest_name"],
    entryFee: json["entry_fee"],
    winingAmount: json["wining_amount"],
    description: json["description"],
    tossResult: json["toss_result"],
    team1: json["team1"],
    team2: json["team2"],
    matchType: json["match_type"],
    joinList: List<JoinList>.from(json["join_list"].map((x) => JoinList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "toss_winner_contest_id": tossWinnerContestId,
    "user_id": userId,
    "match_id": matchId,
    "contest_name": contestName,
    "entry_fee": entryFee,
    "wining_amount": winingAmount,
    "description": description,
    "toss_result": tossResult,
    "team1": team1,
    "team2": team2,
    "match_type": matchType,
    "join_list": List<dynamic>.from(joinList!.map((x) => x.toJson())),
  };
}

class JoinList {
  JoinList({
    this.userId,
    this.selectedTossResult,
    this.name,
  });

  String? userId;
  String? selectedTossResult;
  String? name;

  factory JoinList.fromJson(Map<String, dynamic> json) => JoinList(
    userId: json["user_id"],
    selectedTossResult: json["selected_toss_result"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "selected_toss_result": selectedTossResult,
    "name": name,
  };
}

