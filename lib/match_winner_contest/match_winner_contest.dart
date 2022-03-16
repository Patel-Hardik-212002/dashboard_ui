import 'dart:convert';
import 'dart:js';

import 'package:dashboard_ui/last_digit_contest/page/update_ldc_contest.dart';
import 'package:dashboard_ui/match_winner_contest/match_winner_preview.dart';
import 'package:dashboard_ui/update_match_winner_contest.dart';
import 'package:dashboard_ui/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_win_loss_contest.dart';
import '../last_digit_contest/page/create_ldc_contest.dart';
import 'match_winner_controller.dart';

class MatchWinnerContest extends StatefulWidget {
  const MatchWinnerContest({Key? key}) : super(key: key);

  @override
  _MatchWinnerContestState createState() => _MatchWinnerContestState();
}

class _MatchWinnerContestState extends State<MatchWinnerContest> {
  MatchWinnerController matchWinnerController = Get.find();
  @override
  void initState() {
    super.initState();
    matchWinnerController.isAddVisible.value = false;
    matchWinnerController.isUpdateVisible.value = false;
    matchWinnerController.isViewVisible.value = false;
    matchWinnerController.getAllWinLossContest();
  }
  @override

  bool isAddVisible = false;
  bool isUpdateVisible = false;
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white30,
      body: Obx(() =>
          Padding(
              padding: const EdgeInsets.all(0),
              child: matchWinnerController.isAddVisible.value
                  ? const CreateMatchWinnerContest()
                  : matchWinnerController.isUpdateVisible.value
                  ? const UpdateMatchWinnerContest()
                  : matchWinnerController.isViewVisible.value
                  ? MatchWinnerResult()
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
                                  "Contest Name".toUpperCase())),
                          DataColumn(
                              label: Text(
                                  "Entry Fee".toUpperCase())),
                          DataColumn(
                              label: Text("Winning Amount"
                                  .toUpperCase())),
                          DataColumn(
                              label: Text(
                                  "No Of Join".toUpperCase())),
                          DataColumn(
                              label: Text("Available Slot"
                                  .toUpperCase())),
                          DataColumn(
                              label:
                              Text("Status".toUpperCase())),
                          DataColumn(
                              label:
                              Text("Action".toUpperCase())),
                        ],
                        rows: List<DataRow>.generate(
                            matchWinnerController.arrOfMatchWinnerContest
                                .length, (index) {
                          return DataRow(cells: [
                            DataCell(
                                Text((index + 1).toString())),
                            DataCell(Text((matchWinnerController
                                .arrOfMatchWinnerContest[index]
                                .team1
                                .toString()
                                .toUpperCase() +
                                " v/s " +
                                matchWinnerController
                                    .arrOfMatchWinnerContest[index]
                                    .team2
                                    .toString())
                                .toString()
                                .toUpperCase())),
                            DataCell(Text((matchWinnerController
                                .arrOfMatchWinnerContest[
                            index]
                                .matchType ==
                                "1"
                                ? "T20"
                                : matchWinnerController
                                .arrOfMatchWinnerContest[
                            index]
                                .matchType ==
                                "2"
                                ? "ODI"
                                : matchWinnerController
                                .arrOfMatchWinnerContest[
                            index]
                                .matchType ==
                                "3"
                                ? "T10"
                                : "TEST")
                                .toString())),
                            DataCell(Text((matchWinnerController
                                .arrOfMatchWinnerContest[index]
                                .contestName)
                                .toString())),
                            DataCell(Text((matchWinnerController
                                .arrOfMatchWinnerContest[index]
                                .entryFee)
                                .toString())),
                            DataCell(Text((matchWinnerController
                                .arrOfMatchWinnerContest[index]
                                .winingAmount)
                                .toString())),
                            DataCell(Text((matchWinnerController
                                .arrOfMatchWinnerContest[index]
                                .joinList!
                                .length
                                .toString())
                                .toString())),
                            DataCell(Text((2 -
                                int.parse(matchWinnerController
                                    .arrOfMatchWinnerContest[index]
                                    .joinList!
                                    .length
                                    .toString()))
                                .toString())),
                            DataCell(Text(
                              (matchWinnerController
                                  .arrOfMatchWinnerContest[
                              index]
                                  .winingTeam ==
                                  null
                                  ? "Upcoming"
                                  : matchWinnerController
                                  .arrOfMatchWinnerContest[
                              index]
                                  .winingTeam ==
                                  "0"
                                  ? "Upcoming"
                                  : "Completed")
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: matchWinnerController
                                      .arrOfMatchWinnerContest[
                                  index]
                                      .winingTeam ==
                                      null
                                      ? Colors.green
                                      : matchWinnerController
                                      .arrOfMatchWinnerContest[
                                  index]
                                      .winingTeam ==
                                      "0"
                                      ? Colors.green
                                      : Colors.red),
                            )),
                            DataCell(Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      matchWinnerController
                                          .isUpdateVisible
                                          .value = true;
                                      matchWinnerController.modelWinLoss =
                                      matchWinnerController
                                          .arrOfMatchWinnerContest[
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
                                      matchWinnerController.isViewVisible
                                          .value = true;
                                      matchWinnerController
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
      floatingActionButton: Obx(() => matchWinnerController.isAddVisible.value
          ? const SizedBox.shrink()
          : Container(
        margin: const EdgeInsets.all(25),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            matchWinnerController.isAddVisible.value = true;
          },
          child: const Icon(Icons.add),
        ),
      )),
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
                onPressed: () {
                  matchWinnerController.deleteContest(context, matchWinnerController.arrOfMatchWinnerContest[index].matchWinnerContestId.toString());
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

  // Future<int> addMatch() async {
  //   http.Response response = await http.post(
  //     Uri.parse('https://codinghouse.in/battingraja/match/addmatch'),
  //     body: {
  //       'team1': team1,
  //       'team2': team2,
  //       'match_type': matchType,
  //       'start_date': startDate,
  //       'description': description,
  //       'status': status,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body);
  //     showSnackBar(context, json['message']);
  //     return 1;
  //   } else {
  //     showSnackBar(context, "Opps! Something went wrong");
  //     return 0;
  //   }
  // }


}
