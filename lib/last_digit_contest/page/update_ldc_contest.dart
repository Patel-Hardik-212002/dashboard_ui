import 'package:dashboard_ui/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../page/home.dart';
import '../../page/utils.dart';
import '../../controller/ldc_controller.dart';

class UpdateLDContest extends StatefulWidget {
  const UpdateLDContest({Key? key}) : super(key: key);

  @override
  _UpdateLDContestState createState() => _UpdateLDContestState();
}

class _UpdateLDContestState extends State<UpdateLDContest> {
  String selectMatch = "";

  String matchId = "";

  bool isMatchVisible = false;

  late TextEditingController textEditingControllerMatch;
  late TextEditingController textEditingControllerEntryFee;
  late TextEditingController winningAmount;
  late TextEditingController contestName;
  late TextEditingController description;
  late TextEditingController inningScore;
  late TextEditingController status;
  late TextEditingController minimumUser;

  late TextEditingController textEditingControllerInningType;

  MatchController matchController = Get.find();
  LDCController ldcController = Get.find();

  @override
  void initState() {
    super.initState();
    matchId = ldcController.modelLdc!.matchId!;
    textEditingControllerEntryFee = TextEditingController(
        text: ldcController.modelLdc!.entryFee.toString());
    winningAmount = TextEditingController(
        text: ldcController.modelLdc!.winningAmount.toString());
    contestName = TextEditingController(
        text: ldcController.modelLdc!.contestName.toString());
    description = TextEditingController(
        text: ldcController.modelLdc!.description.toString());
    inningScore = TextEditingController(
        text: ldcController.modelLdc!.inningScore.toString());
    textEditingControllerInningType = TextEditingController(
        text: ldcController.modelLdc!.inningType.toString());

    textEditingControllerMatch = TextEditingController();
    minimumUser =
        TextEditingController(text: ldcController.modelLdc!.minUser.toString());
    status =
        TextEditingController(text: ldcController.modelLdc!.status.toString());
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
            ldcController.isUpdateVisible.value = false;
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
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                maxLength: 1,
                controller: status,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: 'Enter status',
                    labelText: 'update status'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              width: Get.width * 0.30,
              child: TextField(
                maxLength: 4,
                controller: inningScore,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
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
                      await ldcController.updateContest(
                    matchId,
                    contestName.text,
                    textEditingControllerEntryFee.text,
                    winningAmount.text,
                    description.text,
                    textEditingControllerInningType.text,
                    inningScore.text,
                    minimumUser.toString(),
                    status.text.toString(),
                  );
                  if (result['status'] == "1") {
                    showSnackBar(context, result['message']!);
                    ldcController.isUpdateVisible.value = false;
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
                    child: ldcController.isLoading.value
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
