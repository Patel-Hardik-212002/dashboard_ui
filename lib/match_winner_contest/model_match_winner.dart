// To parse this JSON data, do
//
//     final modelWinLoss = modelWinLossFromJson(jsonString);

import 'dart:convert';

List<ModelWinLoss> modelWinLossFromJson(String str) => List<ModelWinLoss>.from(json.decode(str).map((x) => ModelWinLoss.fromJson(x)));

String modelWinLossToJson(List<ModelWinLoss> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelWinLoss {
  ModelWinLoss({
    this.matchWinnerContestId,
    this.userId,
    this.matchId,
    this.contestName,
    this.entryFee,
    this.winingAmount,
    this.description,
    this.winingTeam,
    this.team1,
    this.team2,
    this.matchType,
    this.joinList,
  });

  String? matchWinnerContestId;
  String? userId;
  String? matchId;
  String? contestName;
  String? entryFee;
  String? winingAmount;
  String? description;
  dynamic? winingTeam;
  String? team1;
  String? team2;
  String? matchType;
  List<JoinList>? joinList;

  factory ModelWinLoss.fromJson(Map<String, dynamic> json) => ModelWinLoss(
    matchWinnerContestId: json["match_winner_contest_id"],
    userId: json["user_id"],
    matchId: json["match_id"],
    contestName: json["contest_name"],
    entryFee: json["entry_fee"],
    winingAmount: json["wining_amount"],
    description: json["description"],
    winingTeam: json["wining_team"],
    team1: json["team1"],
    team2: json["team2"],
    matchType: json["match_type"],
    joinList: List<JoinList>.from(json["join_list"].map((x) => JoinList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "match_winner_contest_id": matchWinnerContestId,
    "user_id": userId,
    "match_id": matchId,
    "contest_name": contestName,
    "entry_fee": entryFee,
    "wining_amount": winingAmount,
    "description": description,
    "wining_team": winingTeam,
    "team1": team1,
    "team2": team2,
    "match_type": matchType,
    "join_list": List<dynamic>.from(joinList!.map((x) => x.toJson())),
  };
}

class JoinList {
  JoinList({
    this.userId,
    this.selectedTeam,
    this.name,
  });

  String? userId;
  String? selectedTeam;
  String? name;

  factory JoinList.fromJson(Map<String, dynamic> json) => JoinList(
    userId: json["user_id"],
    selectedTeam: json["selected_team"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "selected_team": selectedTeam,
    "name": name,
  };
}
