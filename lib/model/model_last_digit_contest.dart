// To parse this JSON data, do
//
//     final modelldc = modelldcFromJson(jsonString);

import 'dart:convert';

List<ModelLdc> modelldcFromJson(String str) => List<ModelLdc>.from(json.decode(str).map((x) => ModelLdc.fromJson(x)));

String modelldcToJson(List<ModelLdc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelLdc {
  ModelLdc({
    this.lastDigitContestId,
    this.userId,
    this.matchId,
    this.contestName,
    this.entryFee,
    this.winningAmount,
    this.description,
    this.inningScore,
    this.inningType,
    this.team1,
    this.team2,
    this.matchType,
    this.joinList,
  });

  String ?lastDigitContestId;
  String ?userId;
  String ?matchId;
  String ?contestName;
  String ?entryFee;
  String ?winningAmount;
  String ?description;
  String ?inningScore;
  String ?inningType;
  String ?team1;
  String ?team2;
  String ?matchType;
  List<JoinList>? joinList;

  factory ModelLdc.fromJson(Map<String, dynamic> json) => ModelLdc(
    lastDigitContestId: json["last_digit_contest_id"],
    userId: json["user_id"],
    matchId: json["match_id"],
    contestName: json["contest_name"],
    entryFee: json["entry_fee"],
    winningAmount: json["winning_amount"],
    description: json["description"],
    inningScore: json["inning_score"] == null ? null : json["inning_score"],
    inningType: json["inning_type"],
    team1: json["team1"],
    team2: json["team2"],
    matchType: json["match_type"],
    joinList: List<JoinList>.from(json["join_list"].map((x) => JoinList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "last_digit_contest_id": lastDigitContestId,
    "user_id": userId,
    "match_id": matchId,
    "contest_name": contestName,
    "entry_fee": entryFee,
    "winning_amount": winningAmount,
    "description": description,
    "inning_score": inningScore == null ? null : inningScore,
    "inning_type": inningType,
    "team1": team1,
    "team2": team2,
    "match_type": matchType,
    "join_list": List<dynamic>.from(joinList!.map((x) => x.toJson())),
  };
}

class JoinList {
  JoinList({
    this.userId,
    this.userSelectedDigit,
    this.name,
  });

  String? userId;
  String ?userSelectedDigit;
  String ?name;

  factory JoinList.fromJson(Map<String, dynamic> json) => JoinList(
    userId: json["user_id"],
    userSelectedDigit: json["user_selected_digit"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_selected_digit": userSelectedDigit,
    "name": name,
  };
}
