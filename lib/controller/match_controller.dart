import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../match/model_match.dart';

class MatchController extends GetxController {


  RxList<ModelMatch> arrOfMatch=<ModelMatch>[].obs;

  Future<Map<String, String>> addMatch(
      String team1,
      String team2,
      String matchType,
      String startDate,
      String description,
      String status) async {
    Map<String, String> result = {};

    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/match/addmatch'),
      body: {
        'team1': team1,
        'team2': team2,
        'match_type': matchType,
        'start_date': startDate,
        'description': description,
        'status': status,
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


  Future<void> getAllMatch() async {
    arrOfMatch.clear();
    http.Response response = await http
        .get(Uri.parse('https://codinghouse.in/battingraja/match/getallmatch'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      arrOfMatch.assignAll((json as List)
          .map((e) => ModelMatch.fromJson(e as Map<String, dynamic>)));

    }
  }



}
