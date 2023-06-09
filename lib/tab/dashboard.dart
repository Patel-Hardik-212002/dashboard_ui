import 'package:dashboard_ui/add_banner/profit_list.dart';
import 'package:dashboard_ui/controller/dashboard_controller.dart';
import 'package:dashboard_ui/controller/ldc_controller.dart';
import 'package:dashboard_ui/last_digit_contest/page/last_digit_contest_list.dart';
import 'package:dashboard_ui/last_digit_contest/page/last_digit_contest_list.dart';
import 'package:dashboard_ui/last_digit_contest/page/last_digit_contest_list.dart';
import 'package:dashboard_ui/last_digit_contest/page/last_digit_contest_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashboardController = Get.find();
  @override
  void initState() {
    super.initState();
    dashboardController.dashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>Column(
        children: [
          const SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(

                  onTap: (){
                       // Get.off(LastDigitWinningContest());

                  },
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dashboardController.totalLdc.value.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dashboardController.totalToss.value.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Toss Winner Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dashboardController.totalOver.value.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Less Run Per Over Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dashboardController.totalMatchWinner.value.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Match Winner Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){
                    // Get.off(Profit());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(dashboardController.totalProfit.value.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                       SizedBox(height: 10,),
                      Text("admin profit".toUpperCase())
                    ],
                  ),
                ),
              )),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Expanded(child: Container(
          //       margin: EdgeInsets.all(16),
          //       constraints: BoxConstraints(
          //           minHeight: 150,
          //           minWidth: 100
          //       ),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: Colors.grey,width: 1),
          //           borderRadius: BorderRadius.circular(12)
          //       ),
          //       child: InkWell(
          //         onTap: (){
          //
          //         },
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          //             SizedBox(height: 10,),
          //             Text("Last Digit Contest".toUpperCase())
          //           ],
          //         ),
          //       ),
          //     )),
          //     Expanded(child: Container(
          //       margin: EdgeInsets.all(16),
          //       constraints: BoxConstraints(
          //           minHeight: 150,
          //           minWidth: 100
          //       ),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: Colors.grey,width: 1),
          //           borderRadius: BorderRadius.circular(12)
          //       ),
          //       child: InkWell(
          //         onTap: (){
          //
          //         },
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          //             SizedBox(height: 10,),
          //             Text("Last Digit Contest".toUpperCase())
          //           ],
          //         ),
          //       ),
          //     )),
          //     Expanded(child: Container(
          //       margin: EdgeInsets.all(16),
          //       constraints: BoxConstraints(
          //           minHeight: 150,
          //           minWidth: 100
          //       ),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: Colors.grey,width: 1),
          //           borderRadius: BorderRadius.circular(12)
          //       ),
          //       child: InkWell(
          //         onTap: (){
          //
          //         },
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          //             SizedBox(height: 10,),
          //             Text("Last Digit Contest".toUpperCase())
          //           ],
          //         ),
          //       ),
          //     )),
          //     Expanded(child: Container(
          //       margin: EdgeInsets.all(16),
          //       constraints: BoxConstraints(
          //           minHeight: 150,
          //           minWidth: 100
          //       ),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: Colors.grey,width: 1),
          //           borderRadius: BorderRadius.circular(12)
          //       ),
          //       child: InkWell(
          //         onTap: (){
          //
          //         },
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          //             SizedBox(height: 10,),
          //             Text("Last Digit Contest".toUpperCase())
          //           ],
          //         ),
          //       ),
          //     )),
          //   ],
          // )
        ],
      )),
    );
  }
}
