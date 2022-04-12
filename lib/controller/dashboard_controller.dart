import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DashboardController extends GetxController {

  RxBool isAddVisible = false.obs;
  RxBool isUpdateVisible = false.obs;
  RxBool isViewVisible = false.obs;
  RxBool isLoading = false.obs;

  RxString totalLdc = "".obs;
  RxString totalToss = "".obs;
  RxString totalOver="".obs;
  RxString totalMatchWinner="".obs;


  Future<void> dashboard() async {
    isLoading.value = true;
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/dashboard/getdashborddetail'));

    if (response.statusCode == 200) {
      isLoading.value = false;
      var json = jsonDecode(response.body);
      totalLdc.value = json['ldc'].toString();
      totalToss.value = json['toss'].toString();
      totalOver.value = json['lrpo'].toString();
      totalMatchWinner.value = json['match'].toString();
    } else {
      isLoading.value = false;
    }
  }

}
