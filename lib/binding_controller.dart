import 'package:dashboard_ui/last_digit_contest/controller/ldc_controller.dart';
import 'package:dashboard_ui/match/match_controller.dart';
import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => MatchController(),fenix: true);
    Get.lazyPut(() => LDCController(),fenix: true);
    Get.lazyPut(() => TossController(),fenix: true);
  }

}