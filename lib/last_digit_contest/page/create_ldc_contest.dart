import 'package:dashboard_ui/home.dart';
import 'package:dashboard_ui/last_digit_contest/controller/ldc_controller.dart';
import 'package:dashboard_ui/match/match_controller.dart';
import 'package:dashboard_ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateContest extends StatefulWidget {
  const CreateContest({Key? key}) : super(key: key);

  @override
  _CreateContestState createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  String selectMatch = "";
  String matchId = "";

  // String winningAmount = "";
  // String contestName = "";

  String description = "Test Data";
  bool isMatchVisible = false;

  // late TextEditingController entryFee;
  late TextEditingController textEditingControllerMatch;
  late TextEditingController inningType;
  late TextEditingController entryFee;
  late TextEditingController winningAmount;
  late TextEditingController totalUser;
  late TextEditingController contestName;

  MatchController matchController = Get.find();
  LDCController ldcController = Get.find();

  @override
  void initState() {
    super.initState();

    inningType = TextEditingController();
    textEditingControllerMatch = TextEditingController();
    entryFee = TextEditingController();
    winningAmount = TextEditingController();
    contestName = TextEditingController();
    totalUser = TextEditingController();
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
            ldcController.isAddVisible.value = false;
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
                controller: entryFee,
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
                controller: inningType,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (String value) {
                  if (int.parse(value) > 4) {
                    inningType.clear();
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
                  int totalAmount =
                      int.parse(entryFee.text.toString()) *
                          10;

                  double minimumUser = int.parse(
                          winningAmount.text.toString()) /
                      int.parse(entryFee.text.toString())
                          .round();

                  if (int.parse(winningAmount.text.toString()) >
                      (int.parse(
                          entryFee.text.toString()) *
                          10)) {
                    showSnackBar(context,
                        "Winning amount must be less than $totalAmount or equal to $totalAmount");
                  } else {
                    Map<String, String> result =
                        await ldcController.createContest(
                            matchId,
                            contestName.text,
                            entryFee.text,
                            winningAmount.text,
                            description,
                            inningType.text,
                            minimumUser.toString());

                    if (result['status'] == "1") {
                      showSnackBar(context, result['message']!);
                      ldcController.getAllLDC();
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
                    child: ldcController.isLoading.value
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

          ],
        ),
      ),
    );
  }
}
