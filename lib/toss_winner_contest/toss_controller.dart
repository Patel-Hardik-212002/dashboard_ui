import 'dart:convert';

import 'package:dashboard_ui/toss_winner_contest/model_toss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';


class TossController extends GetxController {

  RxBool isAddVisible = false.obs;
  RxBool isUpdateVisible = false.obs;
  RxBool isViewVisible =false.obs;
  RxBool isLoading =false.obs;



  RxList<ModelToss> arrOfTossContest = <ModelToss>[].obs;
  int selectedContest=-1;

  ModelToss? modelToss;


  Future<void> getAllTossContest() async {
    arrOfTossContest.clear();
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/toss/getalltosscontest?type=WEB'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      arrOfTossContest.addAll((json as List)
          .map((e) => ModelToss.fromJson(e as Map<String, dynamic>)));
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
          'https://codinghouse.in/battingraja/toss/createtosscontest'),
      body: {
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'wining_amount': winningAmount,
        'description': description,
        'inning_type': inningType,
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
  String tossResult) async {
    Map<String, String> result = {};

    http.Response response = await http.post(
      Uri.parse(
          'https://codinghouse.in/battingraja/toss/updatetosscontest'),
      body: {
        'toss_winner_contest_id': modelToss!.tossWinnerContestId.toString(),
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'wining_amount': winningAmount,
        'description': description,
        'toss_result': tossResult,

      },
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      getAllTossContest();
      return result;
    } else {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      return result;
    }
  }


  Future<int> deleteContest(BuildContext context, String id) async {

    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/toss/deletecontest'),
      body: {'toss_winner_contest_id': id},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      showSnackBar(context, json['message']);
      return 1;
    } else {
      showSnackBar(context, "Opps! Something went wrong");
      return 0;
    }
  }
}
