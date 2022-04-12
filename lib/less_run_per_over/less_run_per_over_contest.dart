import 'dart:js';

import 'package:dashboard_ui/last_digit_contest/page/update_ldc_contest.dart';
import 'package:dashboard_ui/less_run_per_over/update_less_run_per_over_contest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_less_run_per_over_contest.dart';
import '../last_digit_contest/create_ldc_contest.dart';
import '../controller/less_run_per_over_controller.dart';
import 'less_run_per_over_preview.dart';

class LessRunPerOver extends StatefulWidget {
  const LessRunPerOver({Key? key}) : super(key: key);

  @override
  _LessRunPerOverState createState() => _LessRunPerOverState();
}

class _LessRunPerOverState extends State<LessRunPerOver> {
  LessRunPerOverController lessRunPerOverController = Get.find();

  @override
  void initState() {
    super.initState();
    lessRunPerOverController.isAddVisible.value = false;
    lessRunPerOverController.isUpdateVisible.value = false;
    lessRunPerOverController.isViewVisible.value = false;
    lessRunPerOverController.getAllOver();
  }
  @override
  bool isAddVisible = false;
  bool isUpdateVisible = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Obx(() =>
          Padding(
              padding: const EdgeInsets.all(0),
              child: lessRunPerOverController.isAddVisible.value
                  ? const CreateLessRunPerOverContest()
                  : lessRunPerOverController.isUpdateVisible.value
                  ? const UpdateLessRunPerOverContest()
                  : lessRunPerOverController.isViewVisible.value
                  ? const LessRunPerOverResult()
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
                              label: Text("Winning\nAmount"
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
                            lessRunPerOverController.arrOfLessRunPerOver
                                .length, (index) {
                          return DataRow(cells: [
                            DataCell(
                                Text((index + 1).toString())),
                            DataCell(Text((lessRunPerOverController
                                .arrOfLessRunPerOver[index]
                                .team1
                                .toString()
                                .toUpperCase() +
                                " v/s " +
                                lessRunPerOverController
                                    .arrOfLessRunPerOver[index]
                                    .team2
                                    .toString())
                                .toString()
                                .toUpperCase())),
                            DataCell(Text((lessRunPerOverController
                                .arrOfLessRunPerOver[
                            index]
                                .matchType ==
                                "1"
                                ? "T20"
                                : lessRunPerOverController
                                .arrOfLessRunPerOver[
                            index]
                                .matchType ==
                                "2"
                                ? "ODI"
                                : lessRunPerOverController
                                .arrOfLessRunPerOver[
                            index]
                                .matchType ==
                                "3"
                                ? "T10"
                                : "TEST")
                                .toString())),
                            DataCell(Text((lessRunPerOverController
                                .arrOfLessRunPerOver[index]
                                .contestName)
                                .toString())),
                            DataCell(Text((lessRunPerOverController
                                .arrOfLessRunPerOver[index]
                                .entryFee)
                                .toString())),
                            DataCell(Text((lessRunPerOverController
                                .arrOfLessRunPerOver[index]
                                .winningAmount)
                                .toString())),
                            DataCell(Text((lessRunPerOverController
                                .arrOfLessRunPerOver[index]
                                .joinList==null?"-":lessRunPerOverController
                                .arrOfLessRunPerOver[index]
                                .joinList!
                                .length
                                .toString())
                                .toString())),
                            DataCell(Text((20 -
                                int.parse(lessRunPerOverController
                                    .arrOfLessRunPerOver[index]
                                    .joinList!
                                    .length
                                    .toString()))
                                .toString())),

                            DataCell(Text(
                              lessRunPerOverController
                                  .arrOfLessRunPerOver[
                              index]
                                  .status ==
                                  "1"
                                  ? "Upcoming"
                                  : lessRunPerOverController
                                  .arrOfLessRunPerOver[
                              index]
                                  .status ==
                                  "2"
                                  ? "Ongoing"
                                  : lessRunPerOverController
                                  .arrOfLessRunPerOver[
                              index]
                                  .status ==
                                  "3"?"Completed":"Cancel"
                              ,
                              style: TextStyle(
                                  color: lessRunPerOverController
                                      .arrOfLessRunPerOver[
                                  index]
                                      .status ==
                                      "1"
                                      ? Colors.black
                                      : lessRunPerOverController
                                      .arrOfLessRunPerOver[
                                  index]
                                      .status ==
                                      "2"
                                      ? Colors.green
                                      : lessRunPerOverController
                                      .arrOfLessRunPerOver[
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
                                      lessRunPerOverController
                                          .isUpdateVisible
                                          .value = true;
                                      lessRunPerOverController.modelOver =
                                      lessRunPerOverController
                                          .arrOfLessRunPerOver[
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
                                      lessRunPerOverController.isViewVisible
                                          .value = true;
                                      lessRunPerOverController
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
      floatingActionButton: Obx(() => lessRunPerOverController.isAddVisible.value
          ? const SizedBox.shrink()
          : Container(
        margin: const EdgeInsets.all(25),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            lessRunPerOverController.isAddVisible.value = true;
          },
          child: const Icon(Icons.add),
        ),
      )),
    );
  }


  Future showConfirmDelete(BuildContext context,int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  lessRunPerOverController.deleteContest( lessRunPerOverController.arrOfLessRunPerOver[index].lessRunPerOverContestId.toString());
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