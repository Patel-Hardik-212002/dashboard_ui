import 'package:dashboard_ui/controller/less_run_per_over_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessRunPerOverResult extends StatefulWidget {
  const LessRunPerOverResult({Key? key}) : super(key: key);

  @override
  _LessRunPerOverResultState createState() => _LessRunPerOverResultState();
}

class _LessRunPerOverResultState extends State<LessRunPerOverResult> {
  LessRunPerOverController lessRunPerOverController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              lessRunPerOverController.isViewVisible.value = false;
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            DataTable(
                headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 2.0),
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'No'.toUpperCase(),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name'.toUpperCase(),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Selected team'.toUpperCase(),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                    lessRunPerOverController
                        .arrOfLessRunPerOver[
                            lessRunPerOverController.selectedContest]
                        .joinList!
                        .length, (index) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(lessRunPerOverController
                              .arrOfLessRunPerOver[
                                  lessRunPerOverController.selectedContest]
                              .joinList![index]
                              .name ??
                          "-")),
                      DataCell(Text(lessRunPerOverController
                              .arrOfLessRunPerOver[
                                  lessRunPerOverController.selectedContest]
                              .joinList![index]
                              .userSelectedOver ??
                          "-")),
                    ],
                  );
                }))
          ],
        ));
  }
  //
  // Widget HDivier() {
  //   return Container(
  //     width: 1,
  //     height: 30,
  //     color: Colors.white,
  //   );
  // }
}
