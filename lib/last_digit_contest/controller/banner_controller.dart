import 'dart:convert';

import 'package:dashboard_ui/model/model_banner.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/model_last_digit_contest.dart';

class BannerController extends GetxController {

  RxBool isAddVisible = false.obs;
  RxBool isUpdateVisible = false.obs;

  // RxBool isViewVisible =false.obs;
  RxBool isLoading = false.obs;


  RxList<ModelBanner> arrOfBanner = <ModelBanner>[].obs;
  int selectedContest = -1;

  ModelBanner? modelBanner;

  Future<void> getAllBanner() async {
    arrOfBanner.clear();
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/banner/getallbanner'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      arrOfBanner.addAll((json as List)
          .map((e) => ModelBanner.fromJson(e as Map<String, dynamic>)));
    }
  }

}
