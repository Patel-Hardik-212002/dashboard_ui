import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TossResult extends StatefulWidget {
  const TossResult({Key? key}) : super(key: key);

  @override
  _TossResultState createState() => _TossResultState();
}

class _TossResultState extends State<TossResult> {
  TossController tossController = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              tossController.isViewVisible.value=false;
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
                    tossController.arrOfTossContest[tossController.selectedContest]
                        .joinList!.length, (index) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(tossController
                          .arrOfTossContest[tossController.selectedContest]
                          .joinList![index]
                          .name ??
                          "-")),
                      DataCell(Text(tossController
                          .arrOfTossContest[tossController.selectedContest]
                          .joinList![index]
                          .selectedTossResult ??
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
