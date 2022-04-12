import 'dart:convert';

import 'package:dashboard_ui/controller/ldc_controller.dart';
import 'package:dashboard_ui/last_digit_contest/page/update_ldc_contest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../page/utils.dart';
import '../create_ldc_contest.dart';
import 'ldc_result.dart';

class LastDigitWinningContest extends StatefulWidget {
  const LastDigitWinningContest({Key? key}) : super(key: key);

  @override
  _LastDigitWinningContestState createState() =>
      _LastDigitWinningContestState();
}

class _LastDigitWinningContestState extends State<LastDigitWinningContest> {
  LDCController ldcController = Get.find();

  @override
  void initState() {
    super.initState();
    ldcController.getAllLDC();
    ldcController.isAddVisible.value = false;
    ldcController.isUpdateVisible.value = false;
    ldcController.isViewVisible.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Obx(() => Padding(
          padding: const EdgeInsets.all(0),
          child: ldcController.isAddVisible.value
              ? const CreateContest()
              : ldcController.isUpdateVisible.value
                  ? const UpdateLDContest()
                  : ldcController.isViewVisible.value
                      ? const LDCResult()
                      : ldcController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
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
                                          label:
                                              Text("Match Type".toUpperCase())),
                                      DataColumn(
                                          label: Text(
                                              "Contest\nName".toUpperCase())),
                                      DataColumn(
                                          label:
                                              Text("Entry\nFee".toUpperCase())),
                                      DataColumn(
                                          label: Text(
                                              "Winning\nAmount".toUpperCase())),
                                      DataColumn(
                                          label:
                                              Text("No Of Join".toUpperCase())),
                                      DataColumn(
                                          label: Text(
                                              "Available\nSlot".toUpperCase())),
                                      DataColumn(
                                          label: Text("Status".toUpperCase())),
                                      DataColumn(
                                          label: Text("Action".toUpperCase())),
                                    ],
                                    rows: List<DataRow>.generate(
                                        ldcController.arrOfLDC.length, (index) {
                                      return DataRow(cells: [
                                        DataCell(Text((index + 1).toString())),
                                        DataCell(Text((ldcController
                                                    .arrOfLDC[index].team1
                                                    .toString()
                                                    .toUpperCase() +
                                                " v/s " +
                                                ldcController
                                                    .arrOfLDC[index].team2
                                                    .toString())
                                            .toString()
                                            .toUpperCase())),
                                        DataCell(Text((ldcController
                                                        .arrOfLDC[index]
                                                        .matchType ==
                                                    "1"
                                                ? "T20"
                                                : ldcController.arrOfLDC[index]
                                                            .matchType ==
                                                        "2"
                                                    ? "ODI"
                                                    : ldcController
                                                                .arrOfLDC[index]
                                                                .matchType ==
                                                            "3"
                                                        ? "T10"
                                                        : "TEST")
                                            .toString())),
                                        DataCell(Text((ldcController
                                                .arrOfLDC[index].contestName)
                                            .toString())),
                                        DataCell(Text((ldcController
                                                .arrOfLDC[index].entryFee)
                                            .toString())),
                                        DataCell(Text((ldcController
                                                .arrOfLDC[index].winningAmount)
                                            .toString())),
                                        DataCell(Text((ldcController
                                                .arrOfLDC[index]
                                                .joinList!
                                                .length
                                                .toString())
                                            .toString())),
                                        DataCell(Text((10 -
                                                int.parse(ldcController
                                                    .arrOfLDC[index]
                                                    .joinList!
                                                    .length
                                                    .toString()))
                                            .toString())),
                                        // DataCell(Text(
                                        //   (ldcController.arrOfLDC[index]
                                        //                   .inningScore ==
                                        //               null
                                        //           ? "Upcoming"
                                        //           : ldcController
                                        //                       .arrOfLDC[index]
                                        //                       .inningScore ==
                                        //                   "0"
                                        //               ? "Upcoming"
                                        //               : "Completed")
                                        //       .toString()
                                        //       .toUpperCase(),
                                        //   style: TextStyle(
                                        //       color: ldcController
                                        //                   .arrOfLDC[index]
                                        //                   .inningScore ==
                                        //               null
                                        //           ? Colors.green
                                        //           : ldcController
                                        //                       .arrOfLDC[index]
                                        //                       .inningScore ==
                                        //                   "0"
                                        //               ? Colors.green
                                        //               : Colors.red),
                                        // )),
                                        DataCell(Text(
                                          ldcController
                                              .arrOfLDC[
                                          index]
                                              .status ==
                                              "1"
                                              ? "Upcoming"
                                              : ldcController
                                              .arrOfLDC[
                                          index]
                                              .status ==
                                              "2"
                                              ? "Ongoing"
                                              : ldcController
                                              .arrOfLDC[
                                          index]
                                              .status ==
                                              "3"?"Completed":"Cancel"
                                          ,
                                          style: TextStyle(
                                              color: ldcController
                                                  .arrOfLDC[
                                              index]
                                                  .status ==
                                                  "1"
                                                  ? Colors.black
                                                  : ldcController
                                                  .arrOfLDC[
                                              index]
                                                  .status ==
                                                  "2"
                                                  ? Colors.green
                                                  : ldcController
                                                  .arrOfLDC[
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
                                                  ldcController.isUpdateVisible
                                                      .value = true;
                                                  ldcController.modelLdc =
                                                      ldcController
                                                          .arrOfLDC[index];
                                                  setState(() {});
                                                },
                                                icon: const Icon(Icons.edit)),
                                            IconButton(
                                                onPressed: () async {
                                                  showConfirmDelete(
                                                      context, index);
                                                },
                                                icon: const Icon(Icons.delete)),
                                            IconButton(
                                                onPressed: () async {
                                                  ldcController.isViewVisible
                                                      .value = true;
                                                  ldcController
                                                      .selectedContest = index;
                                                  setState(() {});
                                                },
                                                icon: const Icon(
                                                    Icons.remove_red_eye))
                                          ],
                                        )),
                                      ]);
                                    }))
                              ],
                            ))),
      floatingActionButton: Obx(() => ldcController.isAddVisible.value
          ? const SizedBox.shrink()
          : Container(
              margin: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  ldcController.isAddVisible.value = true;
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
                  int result = await deleteContest(
                      ldcController.arrOfLDC[index].lastDigitContestId!);
                  if (result == 1) {
                    ldcController.getAllLDC();
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

  Future<int> deleteContest(String id) async {
    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/ldc/deletecontest'),
      body: {'last_digit_contest_id': id},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      showSnackBar(context, json['message']);
      return 1;
    } else {
      showSnackBar(context, "Opps! Something went wrong");
      return 0;
    }
  }
}
