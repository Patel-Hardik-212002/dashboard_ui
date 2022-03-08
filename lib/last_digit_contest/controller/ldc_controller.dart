import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/model_last_digit_contest.dart';

class LDCController extends GetxController {

  RxBool isAddVisible = false.obs;
  RxBool isUpdateVisible = false.obs;
  RxBool isViewVisible =false.obs;
  RxBool isLoading =false.obs;



  RxList<ModelLdc> arrOfLDC = <ModelLdc>[].obs;
  int selectedContest=-1;

  ModelLdc? modelLdc;

  Future<void> getAllLDC() async {
    arrOfLDC.clear();
    isLoading.value=true;
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/ldc/getalllastdigitcontest'));

    if (response.statusCode == 200) {
      isLoading.value=false;
      var json = jsonDecode(response.body);
      arrOfLDC.addAll((json as List)
          .map((e) => ModelLdc.fromJson(e as Map<String, dynamic>)));
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
          'https://codinghouse.in/battingraja/ldc/createlastdigitcontest'),
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
      String inningType, String inningScore) async {
    Map<String, String> result = {};
    isLoading.value=true;
    http.Response response = await http.post(

      Uri.parse(
          'https://codinghouse.in/battingraja/ldc/updatelastdigitcontest'),
      body: {
        'last_digit_contest_id': modelLdc!.lastDigitContestId.toString(),
        'user_id': "1",
        'match_id': matchId,
        'contest_name': contestName,
        'entry_fee': entryFee,
        'winning_amount': winningAmount,
        'description': description,
        'inning_type': inningType,
        'inning_score': inningScore,
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      getAllLDC();
      isLoading.value=false;
      return result;
    } else  {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      isLoading.value=false;
      return result;
    }

  }


  Future<Map<String, String>> deleteContest(String matchId) async {
    Map<String, String> result = {};

    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/user/deletecontest'),
      body: {'match_id': matchId},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result['status'] = "1";
      result['message'] = json['message'];
      getAllLDC();
      return result;
    } else {
      result['status'] = "0";
      result['message'] = "Opps! Something went wrong";
      return result;
    }
  }
}
