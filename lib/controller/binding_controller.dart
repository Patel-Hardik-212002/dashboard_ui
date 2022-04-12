import 'package:dashboard_ui/controller/banner_controller.dart';
import 'package:dashboard_ui/controller/ldc_controller.dart';
import 'package:dashboard_ui/controller/match_controller.dart';
import 'package:dashboard_ui/controller/match_winner_controller.dart';
import 'package:dashboard_ui/controller/toss_controller.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';
import 'less_run_per_over_controller.dart';
import 'match_winner_controller.dart';

class BindingController extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => MatchController(),fenix: true);
    Get.lazyPut(() => LDCController(),fenix: true);
    Get.lazyPut(() => TossController(),fenix: true);
    Get.lazyPut(() => BannerController(),fenix: true);
    Get.lazyPut(() => MatchWinnerController(),fenix: true);
    Get.lazyPut(() => LessRunPerOverController(),fenix: true);
    Get.lazyPut(() => DashboardController(),fenix: true);

  }

}