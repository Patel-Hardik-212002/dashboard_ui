import 'dart:convert';

import 'package:dashboard_ui/model/model_less_run_per_over_contest.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/model_less_run_per_over_contest.dart';

class LessRunPerOverController extends GetxController {

  RxBool isAddVisible = false.obs;
  RxBool isUpdateVisible = false.obs;
  RxBool isViewVisible =false.obs;
  RxBool isLoading =false.obs;



  RxList<ModelOver> arrOfLessRunPerOver = <ModelOver>[].obs;
  int selectedContest=-1;

  ModelOver? modelOver;

  Future<void> getAllOver() async {
    arrOfLessRunPerOver.clear();
    isLoading.value=true;
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/over/getallovercontest'));

    if (response.statusCode == 200) {
      isLoading.value=false;
      var json = jsonDecode(response.body);
      arrOfLessRunPerOver.addAll((json as List)
          .map((e) => ModelOver.fromJson(e as Map<String, dynamic>)));
    }else{
      isLoading.value=false;
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
          'https://codinghouse.in/battingraja/over/createovercontest'),
      body: {
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'winning_amount': winningAmount,
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
      String inningType, String winningOver,String overScore,String status) async {
    Map<String, String> result = {};
    isLoading.value=true;
    http.Response response = await http.post(

      Uri.parse(
          'https://codinghouse.in/battingraja/over/updateovercontest'),
      body: {
         'less_run_per_over_contest_id': modelOver!.lessRunPerOverContestId.toString(),
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'winning_amount': winningAmount,
        'description': description,
        'inning_type': inningType,
        'winning_over': winningOver,
        'over_score': overScore,
        'status':status,
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      getAllOver();
      isLoading.value=false;
      return result;
    } else  {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      isLoading.value=false;
      return result;
    }

  }


  Future<Map<String, String>> deleteContest(String id) async {
    Map<String, String> result = {};

    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/over/deletecontest'),
      body: {'less_run_per_over_contest_id': id},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      getAllOver();
      return result;
    } else {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      return result;
    }
  }
}
