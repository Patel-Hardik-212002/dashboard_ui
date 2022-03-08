import 'dart:convert';
import 'dart:js';
import 'package:dashboard_ui/toss_preview.dart';
import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
import 'package:dashboard_ui/toss_winner_contest/update_toss_contest.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard_ui/last_digit_contest/page/update_ldc_contest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../last_digit_contest/page/create_ldc_contest.dart';
import '../last_digit_contest/page/ldc_result.dart';
import '../utils.dart';
import 'create_toss_contest.dart';

class TossWinnerContest extends StatefulWidget {

  const TossWinnerContest({Key? key}) : super(key: key);

  @override
  _TossWinnerContestState createState() => _TossWinnerContestState();
}

class _TossWinnerContestState extends State<TossWinnerContest> {
  

  TossController tossController=Get.find();
  @override
  void initState() {
    super.initState();
    tossController.isAddVisible=false;
    tossController.isUpdateVisible=false;
    tossController.isViewVisible=false;
    tossController.getAllTossContest();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white30,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: tossController.isAddVisible
            ? const CreateTossContest()
            : tossController.isUpdateVisible
            ? const UpdateTossContest(): tossController.isViewVisible?TossResult()
            : Obx(()=>GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 2 / 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: List.generate(tossController.arrOfTossContest.length, (index) {
            return Container(
              padding: const EdgeInsets.all(8),
              // margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8),

              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Match: " + tossController.arrOfTossContest[index].team1!+" v/s "+tossController.arrOfTossContest[index].team2!,
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("Match Type:" + tossController.arrOfTossContest[index].matchType!,
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("User Name:" + tossController.arrOfTossContest[index].userId!,
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("Entry Fees:" + tossController.arrOfTossContest[index].entryFee!,
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("Winning Amount:" + tossController.arrOfTossContest[index].winingAmount!,
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () async {
                              tossController.isUpdateVisible=true;
                              tossController.model_toss=tossController.arrOfTossContest[index];
                              setState(() {

                              });

                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {
                              // int result = await deleteContest(
                              //     tossController.arrOfTossContest[index].lastDigitContestId!);
                              // if (result == 1) {
                              //   tossController.getAllLDC();
                              // }
                              showConfirmDelete(context,index);


                            },
                            icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () async {
                              tossController.isViewVisible=true;
                              setState(() {

                              });


                            },
                            icon: const Icon(Icons.preview))
                      ],

                    ),
                  ]),
            );
          }),
        )),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(25),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (tossController.isUpdateVisible) {
                tossController.isUpdateVisible = false;
              } else {
                tossController.isAddVisible = !tossController.isAddVisible;
              }
            });
          },
          child:
          tossController.isAddVisible || tossController.isUpdateVisible
              ? Icon(Icons.arrow_back_rounded)
              : Icon(Icons.add),
        ),
      ),
    );
  }

  Future showConfirmDelete(BuildContext context,int index){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () async {

                  int result = await tossController.deleteContest(context,tossController.arrOfTossContest[index].tossWinnerContestId!);
                  if (result == 1) {
                    tossController.getAllTossContest();
                  }
                  Navigator.of(context).pop(true);
                },
                child: const Text("DELETE")
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("CANCEL"),
            ),
          ],
        );
      },
    );
  }




}