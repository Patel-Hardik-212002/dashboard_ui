import 'dart:convert';
import 'dart:js';
import 'package:dashboard_ui/toss_winner_contest/toss_preview.dart';
import 'package:dashboard_ui/controller/toss_controller.dart';
import 'package:dashboard_ui/toss_winner_contest/update_toss_contest.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard_ui/last_digit_contest/page/update_ldc_contest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../last_digit_contest/create_ldc_contest.dart';
import '../last_digit_contest/page/ldc_preview.dart';
import '../page/utils.dart';
import 'create_toss_contest.dart';

class TossWinnerContest extends StatefulWidget {
  const TossWinnerContest({Key? key}) : super(key: key);

  @override
  _TossWinnerContestState createState() => _TossWinnerContestState();
}

class _TossWinnerContestState extends State<TossWinnerContest> {
  TossController tossController = Get.find();

  @override
  void initState() {
    super.initState();
    tossController.isAddVisible.value = false;
    tossController.isUpdateVisible.value = false;
    tossController.isViewVisible.value = false;
    tossController.getAllTossContest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Obx(() =>
        Padding(
            padding: const EdgeInsets.all(0),
            child: tossController.isAddVisible.value
                ? const CreateTossContest()
                : tossController.isUpdateVisible.value
                    ? const UpdateTossContest()
                    : tossController.isViewVisible.value
                        ? TossResult()
                : ListView(
              children: [
              Container(
              height: 100,
              width: Get.width,
              color: Colors.white,
            ),
              DataTable(
                                      headingTextStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          letterSpacing: 2.0),
                                      columnSpacing: 32,
                                      columns: [
                                        DataColumn(
                                            label: Text("No".toUpperCase())),
                                        DataColumn(
                                            label: Text("Match".toUpperCase())),
                                        DataColumn(
                                            label: Text(
                                                "Match Type".toUpperCase())),
                                        DataColumn(
                                            label: Text(
                                                "Contest\nName".toUpperCase())),
                                        DataColumn(
                                            label: Text(
                                                "Entry\nFee".toUpperCase())),
                                        DataColumn(
                                            label: Text("Wining\nAmount"
                                                .toUpperCase())),
                                        DataColumn(
                                            label: Text(
                                                "No Of Join".toUpperCase())),
                                        DataColumn(
                                            label: Text("Available\nSlot"
                                                .toUpperCase())),
                                        DataColumn(
                                            label:
                                                Text("Status".toUpperCase())),
                                        DataColumn(
                                            label:
                                                Text("Action".toUpperCase())),
                                      ],
                                      rows: List<DataRow>.generate(
                                          tossController.arrOfTossContest
                                              .length, (index) {
                                        return DataRow(cells: [
                                          DataCell(
                                              Text((index + 1).toString())),
                                          DataCell(Text((tossController
                                                      .arrOfTossContest[index]
                                                      .team1
                                                      .toString()
                                                      .toUpperCase() +
                                                  " v/s " +
                                                  tossController
                                                      .arrOfTossContest[index]
                                                      .team2
                                                      .toString())
                                              .toString()
                                              .toUpperCase())),
                                          DataCell(Text((tossController
                                                          .arrOfTossContest[
                                                              index]
                                                          .matchType ==
                                                      "1"
                                                  ? "T20"
                                                  : tossController
                                                              .arrOfTossContest[
                                                                  index]
                                                              .matchType ==
                                                          "2"
                                                      ? "ODI"
                                                      : tossController
                                                                  .arrOfTossContest[
                                                                      index]
                                                                  .matchType ==
                                                              "3"
                                                          ? "T10"
                                                          : "TEST")
                                              .toString())),
                                          DataCell(Text((tossController
                                                  .arrOfTossContest[index]
                                                  .contestName)
                                              .toString())),
                                          DataCell(Text((tossController
                                                  .arrOfTossContest[index]
                                                  .entryFee)
                                              .toString())),
                                          DataCell(Text((tossController
                                                  .arrOfTossContest[index]
                                                  .winingAmount)
                                              .toString())),
                                          DataCell(Text((tossController
                                                  .arrOfTossContest[index]
                                                  .joinList!
                                                  .length
                                                  .toString())
                                              .toString())),
                                          DataCell(Text((2 -
                                                  int.parse(tossController
                                                      .arrOfTossContest[index]
                                                      .joinList!
                                                      .length
                                                      .toString()))
                                              .toString())),
                                          DataCell(Text(
                                            tossController
                                                            .arrOfTossContest[
                                                                index]
                                                            .status ==
                                                        "1"
                                                    ? "Upcoming"
                                                    : tossController
                                                                .arrOfTossContest[
                                                                    index]
                                                                .status ==
                                                            "2"
                                                        ? "Ongoing"
                                                        : tossController
                                                .arrOfTossContest[
                                            index]
                                                .status ==
                                                "3"?"Completed":"Cancel"
                                              ,
                                            style: TextStyle(
                                                color: tossController
                                                            .arrOfTossContest[
                                                                index]
                                                            .status ==
                                                        "1"
                                                    ? Colors.black
                                                    : tossController
                                                                .arrOfTossContest[
                                                                    index]
                                                                .status ==
                                                            "2"
                                                        ? Colors.green
                                                        : tossController
                                                    .arrOfTossContest[
                                                index]
                                                    .status ==
                                                    "3"?Colors.grey:Colors.red),
                                          )),
                                          DataCell(Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () async {
                                                    tossController
                                                        .isUpdateVisible
                                                        .value = true;
                                                    tossController.modelToss =
                                                        tossController
                                                                .arrOfTossContest[
                                                            index];
                                                    setState(() {});
                                                  },
                                                  icon: const Icon(Icons.edit)),
                                              IconButton(
                                                  onPressed: () async {
                                                    showConfirmDelete(
                                                        context, index);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete)),
                                              IconButton(
                                                  onPressed: () async {
                                                    tossController.isViewVisible
                                                        .value = true;
                                                    tossController
                                                            .selectedContest =
                                                        index;
                                                    setState(() {});
                                                  },
                                                  icon: const Icon(
                                                      Icons.remove_red_eye))
                                            ],
                                          )),
                                        ]);
                                      })
                                      // children: [
                                      //   Text("Match: " + tossController.arrOfTossContest[index].team1!+" v/s "+tossController.arrOfTossContest[index].team2!,
                                      //       style: TextStyle(fontSize: 12),
                                      //       textAlign: (TextAlign.start)),
                                      //   Text("Match Type:" + tossController.arrOfTossContest[index].matchType!,
                                      //       style: TextStyle(fontSize: 12),
                                      //       textAlign: (TextAlign.start)),
                                      //   Text("User Name:" + tossController.arrOfTossContest[index].userId!,
                                      //       style: TextStyle(fontSize: 12),
                                      //       textAlign: (TextAlign.start)),
                                      //   Text("Entry Fees:" + tossController.arrOfTossContest[index].entryFee!,
                                      //       style: TextStyle(fontSize: 12),
                                      //       textAlign: (TextAlign.start)),
                                      //   Text("Winning Amount:" + tossController.arrOfTossContest[index].winingAmount!,
                                      //       style: TextStyle(fontSize: 12),
                                      //       textAlign: (TextAlign.start)),
                                      //   Row(
                                      //     mainAxisAlignment: MainAxisAlignment.end,
                                      //     children: [
                                      //       IconButton(
                                      //           onPressed: () async {
                                      //             tossController.isUpdateVisible=true;
                                      //             tossController.model_toss=tossController.arrOfTossContest[index];
                                      //             setState(() {
                                      //
                                      //             });
                                      //
                                      //           },
                                      //           icon: const Icon(Icons.edit)),
                                      //       IconButton(
                                      //           onPressed: () async {
                                      //             // int result = await deleteContest(
                                      //             //     tossController.arrOfTossContest[index].lastDigitContestId!);
                                      //             // if (result == 1) {
                                      //             //   tossController.getAllLDC();
                                      //             // }
                                      //             showConfirmDelete(context,index);
                                      //
                                      //
                                      //           },
                                      //           icon: const Icon(Icons.delete)),
                                      //       IconButton(
                                      //           onPressed: () async {
                                      //             tossController.isViewVisible=true;
                                      //             setState(() {
                                      //
                                      //             });
                                      //
                                      //
                                      //           },
                                      //           icon: const Icon(Icons.preview))
                                      //     ],
                                      //
                                      //   ),
                                      // ]
                                      ),

                              ])
                            )),
      floatingActionButton: Obx(() => tossController.isAddVisible.value
          ? const SizedBox.shrink()
          : Container(
              margin: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  tossController.isAddVisible.value = true;
                },
                child: const Icon(Icons.add),
              ),
            )),
    );
  }

  Future showConfirmDelete(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () async {
                  int result = await tossController.deleteContest(
                      context,
                      tossController
                          .arrOfTossContest[index].tossWinnerContestId!);
                  if (result == 1) {
                    tossController.getAllTossContest();
                  }
                  Navigator.of(context).pop(true);
                },
                child: const Text("DELETE")),
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
