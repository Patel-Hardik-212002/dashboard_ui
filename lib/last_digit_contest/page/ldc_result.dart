import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ldc_controller.dart';

class LDCResult extends StatefulWidget {
  const LDCResult({Key? key}) : super(key: key);

  @override
  _LDCResultState createState() => _LDCResultState();
}

class _LDCResultState extends State<LDCResult> {
  LDCController ldcController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              ldcController.isViewVisible.value=false;
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
                      'Selected Number'.toUpperCase(),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                    ldcController.arrOfLDC[ldcController.selectedContest]
                        .joinList!.length, (index) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(ldcController
                              .arrOfLDC[ldcController.selectedContest]
                              .joinList![index]
                              .name ??
                          "-")),
                      DataCell(Text(ldcController
                              .arrOfLDC[ldcController.selectedContest]
                              .joinList![index]
                              .userSelectedDigit ??
                          "-")),
                    ],
                  );
                }))
          ],
        ));
  }
}
