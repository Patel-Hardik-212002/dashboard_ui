import 'package:dashboard_ui/match/match_controller.dart';
import 'package:dashboard_ui/match_winner_contest/match_winner_controller.dart';
import 'package:dashboard_ui/toss_winner_contest/model_toss.dart';
import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../home.dart';
import '../../utils.dart';

class UpdateMatchWinnerContest extends StatefulWidget {
  const UpdateMatchWinnerContest({Key? key}) : super(key: key);

  @override
  _UpdateMatchWinnerContestState createState() => _UpdateMatchWinnerContestState();
}

class _UpdateMatchWinnerContestState extends State<UpdateMatchWinnerContest> {
  String selectMatch = "";

  String matchId = "";

  bool isMatchVisible = false;

  late TextEditingController textEditingControllerMatch;
  late TextEditingController textEditingControllerEntryFee;
  late TextEditingController winningAmount;
  late TextEditingController contestName;
  late TextEditingController description;
  late TextEditingController winingTeam;
  late TextEditingController matchWinnerId;
  late TextEditingController userId;

  MatchController matchController = Get.find();
  MatchWinnerController matchWinnerController = Get.find();

  @override
  void initState() {
    super.initState();
    matchId = matchWinnerController.modelWinLoss!.matchId!;
    textEditingControllerEntryFee = TextEditingController(
        text: matchWinnerController.modelWinLoss!.entryFee.toString());
    winningAmount = TextEditingController(
        text: matchWinnerController.modelWinLoss!.winingAmount.toString());
    contestName = TextEditingController(
        text: matchWinnerController.modelWinLoss!.contestName.toString());
    description = TextEditingController(
        text: matchWinnerController.modelWinLoss!.description.toString());
    winingTeam = TextEditingController(
        text: matchWinnerController.modelWinLoss!.winingTeam.toString());
    
    textEditingControllerMatch = TextEditingController();

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
            matchWinnerController.isUpdateVisible.value = false;
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Update Contest".toUpperCase(),
          style: const TextStyle(
              letterSpacing: 2.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        centerTitle: true,
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
            // SizedBox(
            //   height: 60,
            //   width: Get.width * 0.30,
            //   child: TextField(
            //     maxLength: 1,
            //     controller: textEditingControllerInningType,
            //     inputFormatters: <TextInputFormatter>[
            //       FilteringTextInputFormatter.digitsOnly
            //     ],
            //     onChanged: (String value) {
            //       if (int.parse(value) > 4) {
            //         textEditingControllerInningType.clear();
            //         showSnackBar(context, "Inning not more than 4");
            //       }
            //     },
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       hintText: 'Enter Inning Type',
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 16,
            // ),
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                controller: winingTeam,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Score',
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
                  await matchWinnerController.updateContest(
                    matchId,
                    contestName.text,
                    textEditingControllerEntryFee.text,
                    winningAmount.text,
                    description.text,
                    winingTeam.text,
                  );
                  if (result['status'] == "1") {
                    showSnackBar(context, result['message']!);
                    matchWinnerController.isUpdateVisible.value = false;
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
                    child: matchWinnerController.isLoading.value
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      "Update",
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:dashboard_ui/home.dart';
// import 'package:dashboard_ui/last_digit_contest/controller/ldc_controller.dart';
// import 'package:dashboard_ui/match/match_controller.dart';
// import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
// import 'package:dashboard_ui/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class UpdateTossContest extends StatefulWidget {
//   const UpdateTossContest({Key? key}) : super(key: key);
//
//   @override
//   _UpdateTossContestState createState() => _UpdateTossContestState();
// }
//
// class _UpdateTossContestState extends State<UpdateTossContest> {
//   String selectMatch = "";
//   String matchId = "";
//
//   String toss_winner_contest_id = "";
//
//
//   bool isMatchVisible = false;
//
//   late TextEditingController textEditingControllerMatch;
//   late TextEditingController textEditingControllerEntryFee;
//   late TextEditingController winningAmount;
//   late TextEditingController contestName;
//   late TextEditingController description;
//   late TextEditingController tossWinnerContestId;
//
//
//  // late TextEditingController tossResult;
//   late TextEditingController tossResult;
//
//
//   late TextEditingController textEditingControllerInningType;
//
//
//   MatchController matchController = Get.find();
//
//   TossController tossController = Get.find();
//
//
//   @override
//   void initState() {
//     super.initState();
//     matchId = tossController.model_toss!.matchId!;
//     textEditingControllerEntryFee = TextEditingController(
//         text: tossController.model_toss!.entryFee.toString());
//     winningAmount = TextEditingController(
//         text: tossController.model_toss!.winingAmount.toString());
//     contestName = TextEditingController(
//         text: tossController.model_toss!.contestName.toString());
//     description = TextEditingController(
//         text: tossController.model_toss!.description.toString());
//     // tossResult = TextEditingController(
//     //     text: tossController.model_toss!.tossResult.toString());
//     tossResult = TextEditingController();
//           //text: tossController.model_toss!.inningType.toString());
//         textEditingControllerMatch = TextEditingController();
//
//
//         matchController.getAllMatch();
//     }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('UPDATE CONTEST'),
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: [
//                 Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         isMatchVisible = !isMatchVisible;
//                         setState(() {});
//                       },
//                       child: TextField(
//                         onChanged: (String value) {
//                           selectMatch = value;
//                         },
//                         enabled: false,
//                         controller: textEditingControllerMatch,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Select Match',
//                         ),
//                       ),
//                     )),
//                 Expanded(child: Text("")),
//                 Expanded(child: Text(""))
//               ],
//             ),
//             SizedBox(
//               height: isMatchVisible ? 0 : 16,
//             ),
//             isMatchVisible
//                 ? Row(
//               children: [
//                 Expanded(
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: matchController.arrOfMatch.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               matchId = matchController
//                                   .arrOfMatch[index].matchId!;
//                               textEditingControllerMatch.text =
//                                   matchController
//                                       .arrOfMatch[index].team1! +
//                                       " v/s " +
//                                       matchController
//                                           .arrOfMatch[index].team2!;
//
//                               isMatchVisible = false;
//
//                               setState(() {});
//                             },
//                             child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8, vertical: 16),
//                                 color: Colors.transparent,
//                                 // margin: const EdgeInsets.only(bottom: 15),
//                                 child: Row(children: [
//                                   Expanded(
//                                     child: Row(
//                                       children: [
//                                         Text(matchController
//                                             .arrOfMatch[index]
//                                             .matchType ==
//                                             "1"
//                                             ? "T20"
//                                             : matchController
//                                             .arrOfMatch[index]
//                                             .matchType ==
//                                             "2"
//                                             ? "ODI"
//                                             : "TEST"),
//                                         Text("  Match : " +
//                                             matchController
//                                                 .arrOfMatch[index]
//                                                 .team1! +
//                                             " v/s " +
//                                             matchController
//                                                 .arrOfMatch[index].team2!)
//                                       ],
//                                     ),
//                                   ),
//                                   Text(matchController
//                                       .arrOfMatch[index].dateTime
//                                       .toString())
//                                 ])),
//                           );
//                         })),
//                 Expanded(child: Text("")),
//                 Expanded(child: Text(""))
//               ],
//             )
//                 : SizedBox.shrink(),
//             Row(
//               children: [
//                 Expanded(
//                     child: TextField(
//                       maxLength: 5,
//                       inputFormatters: <TextInputFormatter>[
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       controller: textEditingControllerEntryFee,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter Entry Fee',
//                       ),
//                     )),
//                 Expanded(child: Text("")),
//                 Expanded(child: Text(""))
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: TextField(
//                       maxLength: 5,
//                       inputFormatters: <TextInputFormatter>[
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                      controller: winningAmount,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter wining amount',
//                       ),
//                     )),
//                 Expanded(child: Text("")),
//                 Expanded(child: Text(""))
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: TextField(
//                      controller: contestName,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Contest Name',
//                       ),
//                     )),
//                 Expanded(child: Text("")),
//                 Expanded(child: Text(""))
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             // Row(
//             //   children: [
//             //     Expanded(
//             //         child: TextField(
//             //           maxLength: 1,
//             //           controller: textEditingControllerInningType,
//             //           inputFormatters: <TextInputFormatter>[
//             //             FilteringTextInputFormatter.digitsOnly
//             //           ],
//             //           onChanged: (String value) {
//             //             inningType = value;
//             //             if (int.parse(inningType) > 4) {
//             //               textEditingControllerInningType.clear();
//             //               showSnackBar(context, "Inning not more than 4");
//             //
//             //             }
//             //
//             //           },
//             //           decoration: InputDecoration(
//             //             border: OutlineInputBorder(),
//             //             hintText: 'Enter Inning Type',
//             //           ),
//             //         )),
//             //     Expanded(child: Text("")),
//             //     Expanded(child: Text(""))
//             //   ],
//             // ),
//             // const SizedBox(
//             //   height: 16,
//             // ),
//             Row(
//               children: [
//                 Expanded(
//                     child: TextField(
//                       controller: tossResult,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Toss result',
//                       ),
//                     )),
//                 Expanded(child: Text("")),
//                 Expanded(child: Text(""))
//               ],
//             ),
//             SizedBox(
//               height: 150,
//             ),
//             FlatButton(
//               child: const Text(
//                 'Submit',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               color: Colors.blueAccent,
//               textColor: Colors.white,
//               onPressed: () async {
//                 Map<String, String> result =
//                 await tossController.updateContest(
//                     matchId,
//                     contestName.text,
//                     textEditingControllerEntryFee.text,
//                     winningAmount.text,
//                     description.text,
//                     tossResult.text);
//
//                 if (result['status'] == "1") {
//                   showSnackBar(context, result['message']!);
//                   Get.to(Home(
//                     position: 2,
//                   ));
//                 } else {
//                   showSnackBar(context, result['message']!);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
