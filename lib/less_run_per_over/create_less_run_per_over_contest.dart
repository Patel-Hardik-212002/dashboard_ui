import 'package:dashboard_ui/page/home.dart';
import 'package:dashboard_ui/controller/ldc_controller.dart';
import 'package:dashboard_ui/controller/less_run_per_over_controller.dart';
import 'package:dashboard_ui/controller/match_controller.dart';
import 'package:dashboard_ui/controller/toss_controller.dart';
import 'package:dashboard_ui/page/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateLessRunPerOverContest extends StatefulWidget {
  const CreateLessRunPerOverContest({Key? key}) : super(key: key);

  @override
  _CreateLessRunPerOverContestState createState() =>
      _CreateLessRunPerOverContestState();
}

class _CreateLessRunPerOverContestState
    extends State<CreateLessRunPerOverContest> {
  String selectMatch = "";
  String matchId = "";

  // String winningAmount = "";
  // String contestName = "";
  // String inningType = "";
  String description = "Test Data";
  bool isMatchVisible = false;

  // late TextEditingController entryFee;
  late TextEditingController textEditingControllerMatch;
  late TextEditingController textEditingControllerInningType;
  late TextEditingController textEditingControllerEntryFee;
  late TextEditingController winningAmount;
  late TextEditingController contestName;

  MatchController matchController = Get.find();
  LessRunPerOverController lessRunPerOverController = Get.find();

  @override
  void initState() {
    super.initState();

    textEditingControllerInningType = TextEditingController();
    textEditingControllerMatch = TextEditingController();
    textEditingControllerEntryFee = TextEditingController();
    winningAmount = TextEditingController();
    contestName = TextEditingController();
    matchController.getAllMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            lessRunPerOverController.isAddVisible.value = false;
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Create Contest".toUpperCase(),
          style: const TextStyle(letterSpacing: 2.0, color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.30),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const SizedBox(
              height: 32,
            ),
            InkWell(
              onTap: () {
                isMatchVisible = !isMatchVisible;
                setState(() {});
              },
              child: SizedBox(
                height: 60,
                width: Get.width * 0.30,
                child: TextField(
                  enabled: false,
                  controller: textEditingControllerMatch,
                  onChanged: (String value) {
                    selectMatch = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select Match',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: isMatchVisible ? 0 : 16,
            ),
            isMatchVisible
                ? Container(
                    color: Colors.white,
                    width: Get.width * 0.30,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: matchController.arrOfMatch.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              matchId =
                                  matchController.arrOfMatch[index].matchId!;
                              textEditingControllerMatch.text =
                                  matchController.arrOfMatch[index].team1! +
                                      " v/s " +
                                      matchController.arrOfMatch[index].team2!;

                              isMatchVisible = false;

                              setState(() {});
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                color: Colors.transparent,
                                // margin: const EdgeInsets.only(bottom: 15),
                                child: Row(children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(matchController.arrOfMatch[index]
                                                    .matchType ==
                                                "1"
                                            ? "T20"
                                            : matchController.arrOfMatch[index]
                                                        .matchType ==
                                                    "2"
                                                ? "ODI"
                                                : "TEST"),
                                        Text("  Match : " +
                                            matchController
                                                .arrOfMatch[index].team1! +
                                            " v/s " +
                                            matchController
                                                .arrOfMatch[index].team2!)
                                      ],
                                    ),
                                  ),
                                  Text(matchController
                                      .arrOfMatch[index].dateTime
                                      .toString())
                                ])),
                          );
                        }),
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                controller: textEditingControllerEntryFee,
                maxLength: 5,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Entry Fee',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                controller: winningAmount,
                maxLength: 5,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Wining Amount',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                controller: contestName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Contest Name',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                maxLength: 1,
                controller: textEditingControllerInningType,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (String value) {
                  if (int.parse(value) > 4) {
                    textEditingControllerInningType.clear();
                    showSnackBar(context, "Inning not more than 4");
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Inning Type',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () async {
                  Map<String, String> result =
                      await lessRunPerOverController.createContest(
                          matchId,
                          contestName.text,
                          textEditingControllerEntryFee.text,
                          winningAmount.text,
                          description,
                          textEditingControllerInningType.text);

                  if (result['status'] == "1") {
                    showSnackBar(context, result['message']!);
                    lessRunPerOverController.getAllOver();
                    Get.to(Home(
                      position: 1,
                    ));
                  } else {
                    showSnackBar(context, result['message']!);
                  }
                },
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: Center(
                    child: lessRunPerOverController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Create Contest",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.0),
                          ),
                  ),
                ),
              ),
            ),
            // children: <Widget>[
            //   Row(
            //     children: [
            //       Expanded(
            //           child: InkWell(
            //         onTap: () {
            //           isMatchVisible = !isMatchVisible;
            //           setState(() {});
            //         },
            //         child: TextField(
            //           onChanged: (String value) {
            //             selectMatch = value;
            //           },
            //           enabled: false,
            //           controller: textEditingControllerMatch,
            //           decoration: InputDecoration(
            //             border: OutlineInputBorder(),
            //             hintText: 'Select Match',
            //           ),
            //         ),
            //       )),
            //       Expanded(child: Text("")),
            //       Expanded(child: Text(""))
            //     ],
            //   ),
            //   SizedBox(
            //     height: isMatchVisible ? 0 : 16,
            //   ),
            //   isMatchVisible
            //       ? Row(
            //           children: [
            //             Expanded(
            //                 child: ListView.builder(
            //                     shrinkWrap: true,
            //                     physics: const NeverScrollableScrollPhysics(),
            //                     itemCount: matchController.arrOfMatch.length,
            //                     itemBuilder: (context, index) {
            //                       return InkWell(
            //                         onTap: () {
            //                           matchId = matchController
            //                               .arrOfMatch[index].matchId!;
            //                           textEditingControllerMatch.text =
            //                               matchController
            //                                       .arrOfMatch[index].team1! +
            //                                   " v/s " +
            //                                   matchController
            //                                       .arrOfMatch[index].team2!;
            //
            //                           isMatchVisible = false;
            //
            //                           setState(() {});
            //                         },
            //                         child: Container(
            //                             padding: const EdgeInsets.symmetric(
            //                                 horizontal: 8, vertical: 16),
            //                             color: Colors.transparent,
            //                             // margin: const EdgeInsets.only(bottom: 15),
            //                             child: Row(children: [
            //                               Expanded(
            //                                 child: Row(
            //                                   children: [
            //                                     Text(matchController
            //                                                 .arrOfMatch[index]
            //                                                 .matchType ==
            //                                             "1"
            //                                         ? "T20"
            //                                         : matchController
            //                                                     .arrOfMatch[index]
            //                                                     .matchType ==
            //                                                 "2"
            //                                             ? "ODI"
            //                                             : "TEST"),
            //                                     Text("  Match : " +
            //                                         matchController
            //                                             .arrOfMatch[index]
            //                                             .team1! +
            //                                         " v/s " +
            //                                         matchController
            //                                             .arrOfMatch[index].team2!)
            //                                   ],
            //                                 ),
            //                               ),
            //                               Text(matchController
            //                                   .arrOfMatch[index].dateTime
            //                                   .toString())
            //                             ])),
            //                       );
            //                     })),
            //             Expanded(child: Text("")),
            //             Expanded(child: Text(""))
            //           ],
            //         )
            //       : SizedBox.shrink(),
            //   Row(
            //     children: [
            //       Expanded(
            //           child: TextField(
            //         maxLength: 5,
            //         controller: entryFee,
            //         inputFormatters: <TextInputFormatter>[
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'Enter Entry Fee',
            //         ),
            //       )),
            //       Expanded(child: Text("")),
            //       Expanded(child: Text(""))
            //     ],
            //   ),
            //   const SizedBox(
            //     height: 16,
            //   ),
            //   Row(
            //     children: [
            //       Expanded(
            //           child: TextField(
            //         maxLength: 5,
            //         inputFormatters: <TextInputFormatter>[
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         onChanged: (String value) {
            //           winningAmount = value;
            //         },
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'Enter wining amount',
            //         ),
            //       )),
            //       Expanded(child: Text("")),
            //       Expanded(child: Text(""))
            //     ],
            //   ),
            //   const SizedBox(
            //     height: 16,
            //   ),
            //   Row(
            //     children: [
            //       Expanded(
            //           child: TextField(
            //         onChanged: (String value) {
            //           contestName = value;
            //         },
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'Contest Name',
            //         ),
            //       )),
            //       Expanded(child: Text("")),
            //       Expanded(child: Text(""))
            //     ],
            //   ),
            //   const SizedBox(
            //     height: 16,
            //   ),
            //   Row(
            //     children: [
            //       Expanded(
            //           child: TextField(
            //         maxLength: 1,
            //         controller: textEditingControllerInningType,
            //         inputFormatters: <TextInputFormatter>[
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         onChanged: (String value) {
            //           inningType = value;
            //           if (int.parse(inningType) > 4) {
            //             textEditingControllerInningType.clear();
            //             showSnackBar(context, "Inning not more than 4");
            //           }
            //         },
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'Enter Inning Type',
            //         ),
            //       )),
            //       Expanded(child: Text("")),
            //       Expanded(child: Text(""))
            //     ],
            //   ),
            //   const SizedBox(
            //     height: 16,
            //   ),
            //   SizedBox(
            //     height: 150,
            //   ),
            //   FlatButton(
            //     child: const Text(
            //       'Submit',
            //       style: TextStyle(fontSize: 16.0),
            //     ),
            //     color: Colors.blueAccent,
            //     textColor: Colors.white,
            //     onPressed: () async {
            //       Map<String, String> result =
            //           await ldcController.createContest(matchId,contestName,entryFee.text,winningAmount,description,inningType);
            //
            //       if (result['status'] == "1") {
            //         showSnackBar(context, result['message']!);
            //         ldcController.getAllLDC();
            //         Get.to(Home(
            //           position: 1,
            //         ));
            //       } else {
            //         showSnackBar(context, result['message']!);
            //       }
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}
