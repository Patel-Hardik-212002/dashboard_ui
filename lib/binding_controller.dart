import 'package:dashboard_ui/last_digit_contest/controller/banner_controller.dart';
import 'package:dashboard_ui/last_digit_contest/controller/ldc_controller.dart';
import 'package:dashboard_ui/match/match_controller.dart';
import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
import 'package:get/get.dart';

import 'less_run_per_over/less_run_per_over_controller.dart';
import 'match_winner_contest/match_winner_controller.dart';

class BindingController extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => MatchController(),fenix: true);
    Get.lazyPut(() => LDCController(),fenix: true);
    Get.lazyPut(() => TossController(),fenix: true);
    Get.lazyPut(() => BannerController(),fenix: true);
    Get.lazyPut(() => MatchWinnerController(),fenix: true);
    Get.lazyPut(() => LessRunPerOverController(),fenix: true);

  }

}