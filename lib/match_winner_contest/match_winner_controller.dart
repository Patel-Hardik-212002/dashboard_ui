import 'dart:convert';

import 'package:dashboard_ui/toss_winner_contest/model_toss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils.dart';
import 'model_match_winner.dart';


class MatchWinnerController extends GetxController {

  RxBool isAddVisible = false.obs;
  RxBool isUpdateVisible = false.obs;
  RxBool isViewVisible =false.obs;
  RxBool isLoading =false.obs;



  RxList<ModelWinLoss> arrOfMatchWinnerContest = <ModelWinLoss>[].obs;
  int selectedContest=-1;

  ModelWinLoss? modelWinLoss;


  Future<void> getAllWinLossContest() async {
    arrOfMatchWinnerContest.clear();
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/winloss/getallwinlosscontest?user_id=1'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      arrOfMatchWinnerContest.addAll((json as List)
          .map((e) => ModelWinLoss.fromJson(e as Map<String, dynamic>)));
    }
  }

  Future<Map<String, String>> createContest(
      String matchId,
      String contestName,
      String entryFee,
      String winningAmount,
      String description,
      String inningType) async {
    Map<String, String> result = {};

    http.Response response = await http.post(
      Uri.parse(
          'https://codinghouse.in/battingraja/winloss/creatwinlosscontest'),
      body: {
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'wining_amount': winningAmount,
        'description': description,



      },
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      return result;
    } else {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      return result;
    }
  }

  Future<Map<String, String>> updateContest(
      String matchId,
      String contestName,
      String entryFee,
      String winningAmount,
      String description,
      String winingTeam,
 ) async {
    Map<String, String> result = {};

    http.Response response = await http.post(
      Uri.parse(
          'https://codinghouse.in/battingraja/winloss/updatewinlosscontest'),
      body: {
        'match_winner_contest_id': modelWinLoss!.matchWinnerContestId.toString(),
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'wining_amount': winningAmount,
        'description': description,
        'match_winner_contest_id': modelWinLoss!.matchWinnerContestId!.toString(),
        'wining_team': winingTeam,

      },
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      getAllWinLossContest();
      return result;
    } else {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      return result;
    }
  }


  Future<int> deleteContest(BuildContext context, String id) async {

    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/winloss/deletecontest'),
      body: {'match_winner_contest_id': id},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      showSnackBar(context, json['message']);
      getAllWinLossContest();
      return 1;
    } else {
      showSnackBar(context, "Opps! Something went wrong");
      return 0;
    }
  }
}
