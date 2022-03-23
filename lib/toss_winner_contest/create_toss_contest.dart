import 'package:dashboard_ui/home.dart';
import 'package:dashboard_ui/last_digit_contest/controller/ldc_controller.dart';
import 'package:dashboard_ui/match/match_controller.dart';
import 'package:dashboard_ui/toss_winner_contest/toss_controller.dart';
import 'package:dashboard_ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateTossContest extends StatefulWidget {
  const CreateTossContest({Key? key}) : super(key: key);

  @override
  _CreateTossContestState createState() => _CreateTossContestState();
}

class _CreateTossContestState extends State<CreateTossContest> {
  String selectMatch = "";
  String matchId = "";
  // String entryFee = "";


  String inningType = "";
  String description = "Test Data";
  bool isMatchVisible = false;

  late TextEditingController textEditingControllerMatch;
  late TextEditingController textEditingControllerEntryFee;

  late TextEditingController textEditingControllerInningType;
  late TextEditingController winningAmount;
  late TextEditingController contestName;



  MatchController matchController = Get.find();
  TossController tossController   = Get.find();



  @override
  void initState() {
    super.initState();
    textEditingControllerInningType = TextEditingController();
    textEditingControllerMatch = TextEditingController();
    textEditingControllerEntryFee = TextEditingController();
    winningAmount = TextEditingController() ;
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
          onPressed: (){
            tossController.isAddVisible.value=false;
          },
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
        ),
        title: Text("Create Contest".toUpperCase(),style: const TextStyle(letterSpacing: 2.0,color: Colors.black),),
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
            const SizedBox(
              height: 16,
            ),
            Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () async {
    int totalAmount =
    int.parse(textEditingControllerEntryFee.text.toString()) *
    2;

    double minimumUser = int.parse(
    winningAmount.text.toString()) /
    int.parse(textEditingControllerEntryFee.text.toString())
        .round();

    if (int.parse(winningAmount.text.toString()) >
    (int.parse(
    textEditingControllerEntryFee.text.toString()) *
    2)) {
    showSnackBar(context,
    "Winning amount must be less than $totalAmount or equal to $totalAmount");
    } else {
      Map<String, String> result =
      await tossController.createContest(
          matchId, contestName.text, textEditingControllerEntryFee.text,
          winningAmount.text, description, inningType);

      if (result['status'] == "1") {
        showSnackBar(context, result['message']!);
        tossController.getAllTossContest();
        Get.to(Home(
          position: 1,
        ));
      } else {
        showSnackBar(context, result['message']!);
      }
    }
                },
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: Center(
                    child: tossController.isLoading.value
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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('CREAT CONTEST'),
    //     automaticallyImplyLeading: false,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: <Widget>[
    //         Row(
    //           children: [
    //             Expanded(
    //                 child: InkWell(
    //               onTap: () {
    //                 isMatchVisible = !isMatchVisible;
    //                 setState(() {});
    //               },
    //               child: TextField(
    //                 onChanged: (String value) {
    //                   selectMatch = value;
    //                 },
    //                 enabled: false,
    //                 controller: textEditingControllerMatch,
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   hintText: 'Select Match',
    //                 ),
    //               ),
    //             )),
    //             Expanded(child: Text("")),
    //             Expanded(child: Text(""))
    //           ],
    //         ),
    //         SizedBox(
    //           height: isMatchVisible ? 0 : 16,
    //         ),
    //         isMatchVisible
    //             ? Row(
    //                 children: [
    //                   Expanded(
    //                       child: ListView.builder(
    //                           shrinkWrap: true,
    //                           physics: const NeverScrollableScrollPhysics(),
    //                           itemCount: matchController.arrOfMatch.length,
    //                           itemBuilder: (context, index) {
    //                             return InkWell(
    //                               onTap: () {
    //                                 matchId = matchController
    //                                     .arrOfMatch[index].matchId!;
    //                                 textEditingControllerMatch.text =
    //                                     matchController
    //                                             .arrOfMatch[index].team1! +
    //                                         " v/s " +
    //                                         matchController
    //                                             .arrOfMatch[index].team2!;
    //
    //                                 isMatchVisible = false;
    //
    //                                 setState(() {});
    //                               },
    //                               child: Container(
    //                                   padding: const EdgeInsets.symmetric(
    //                                       horizontal: 8, vertical: 16),
    //                                   color: Colors.transparent,
    //                                   // margin: const EdgeInsets.only(bottom: 15),
    //                                   child: Row(children: [
    //                                     Expanded(
    //                                       child: Row(
    //                                         children: [
    //                                           Text(matchController
    //                                                       .arrOfMatch[index]
    //                                                       .matchType ==
    //                                                   "1"
    //                                               ? "T20"
    //                                               : matchController
    //                                                           .arrOfMatch[index]
    //                                                           .matchType ==
    //                                                       "2"
    //                                                   ? "ODI"
    //                                                   : "TEST"),
    //                                           Text("  Match : " +
    //                                               matchController
    //                                                   .arrOfMatch[index]
    //                                                   .team1! +
    //                                               " v/s " +
    //                                               matchController
    //                                                   .arrOfMatch[index].team2!)
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Text(matchController
    //                                         .arrOfMatch[index].dateTime
    //                                         .toString())
    //                                   ])),
    //                             );
    //                           })),
    //                   Expanded(child: Text("")),
    //                   Expanded(child: Text(""))
    //                 ],
    //               )
    //             : SizedBox.shrink(),
    //         Row(
    //           children: [
    //             Expanded(
    //                 child: TextField(
    //               maxLength: 5,
    //               inputFormatters: <TextInputFormatter>[
    //                 FilteringTextInputFormatter.digitsOnly
    //               ],
    //               onChanged: (String value) {
    //                 entryFee = value;
    //               },
    //               decoration: InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 hintText: 'Enter Entry Fee',
    //               ),
    //             )),
    //             Expanded(child: Text("")),
    //             Expanded(child: Text(""))
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 16,
    //         ),
    //         Row(
    //           children: [
    //             Expanded(
    //                 child: TextField(
    //               maxLength: 5,
    //               inputFormatters: <TextInputFormatter>[
    //                 FilteringTextInputFormatter.digitsOnly
    //               ],
    //               onChanged: (String value) {
    //                 winningAmount = value;
    //               },
    //               decoration: InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 hintText: 'Enter wining amount',
    //               ),
    //             )),
    //             Expanded(child: Text("")),
    //             Expanded(child: Text(""))
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 16,
    //         ),
    //         Row(
    //           children: [
    //             Expanded(
    //                 child: TextField(
    //               onChanged: (String value) {
    //                 contestName = value;
    //               },
    //               decoration: InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 hintText: 'Contest Name',
    //               ),
    //             )),
    //             Expanded(child: Text("")),
    //             Expanded(child: Text(""))
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 16,
    //         ),
    //         // Row(
    //         //   children: [
    //         //     Expanded(
    //         //         child: TextField(
    //         //       maxLength: 1,
    //         //       controller: textEditingControllerInningType,
    //         //       inputFormatters: <TextInputFormatter>[
    //         //         FilteringTextInputFormatter.digitsOnly
    //         //       ],
    //         //       onChanged: (String value) {
    //         //         inningType = value;
    //         //         if (int.parse(inningType) > 4) {
    //         //           textEditingControllerInningType.clear();
    //         //           showSnackBar(context, "Inning not more than 4");
    //         //         }
    //         //       },
    //         //       decoration: InputDecoration(
    //         //         border: OutlineInputBorder(),
    //         //         hintText: 'Enter Inning Type',
    //         //       ),
    //         //     )),
    //         //     Expanded(child: Text("")),
    //         //     Expanded(child: Text(""))
    //         //   ],
    //         // ),
    //         // const SizedBox(
    //         //   height: 16,
    //         // ),
    //         SizedBox(
    //           height: 150,
    //         ),
    //         FlatButton(
    //           child: const Text(
    //             'Submit',
    //             style: TextStyle(fontSize: 16.0),
    //           ),
    //           color: Colors.blueAccent,
    //           textColor: Colors.white,
    //           onPressed: () async {
    //             Map<String, String> result =
    //                 await tossController.createContest(matchId,contestName,entryFee,winningAmount,description,inningType);
    //
    //             if (result['status'] == "1") {
    //               showSnackBar(context, result['message']!);
    //               tossController.getAllTossContest();
    //               Get.to(Home(
    //                 position: 2,
    //               ));
    //
    //             } else {
    //               showSnackBar(context, result['message']!);
    //             }
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
