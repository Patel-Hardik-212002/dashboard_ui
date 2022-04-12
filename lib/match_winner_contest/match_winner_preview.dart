import 'package:dashboard_ui/controller/toss_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/match_winner_controller.dart';

class MatchWinnerResult extends StatefulWidget {
  const MatchWinnerResult({Key? key}) : super(key: key);

  @override
  _MatchWinnerResultState createState() => _MatchWinnerResultState();
}

class _MatchWinnerResultState extends State<MatchWinnerResult> {
  MatchWinnerController matchWinnerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              matchWinnerController.isViewVisible.value=false;
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,),
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
                columns:  <DataColumn>[
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
                    matchWinnerController.arrOfMatchWinnerContest[matchWinnerController.selectedContest]
                        .joinList!.length, (index) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(matchWinnerController
                          .arrOfMatchWinnerContest[matchWinnerController.selectedContest]
                          .joinList![index]
                          .name ??
                          "-")),
                      DataCell(Text(matchWinnerController
                          .arrOfMatchWinnerContest[matchWinnerController.selectedContest]
                          .joinList![index]
                          .selectedTeam ??
                          "-")),
                    ],
                  );
                }))
          ],
        ));
  }
  Widget HDivier(){
    return Container(
      width: 1,
      height: 30,
      color: Colors.white,
    );
  }

}
