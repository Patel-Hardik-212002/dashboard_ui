import 'dart:convert';

import 'package:dashboard_ui/controller/match_controller.dart';
import 'package:dashboard_ui/page/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddMatch extends StatefulWidget {
  const AddMatch({Key? key}) : super(key: key);

  @override
  _AddMatchState createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
   
  String matchId = "";
  String team1 = "";
  String team2 = "";
  String matchType = "";
  String startDate = "";
  String startTime = "";
  String description = "";
  String status = "";


  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);


  TextEditingController timeController = TextEditingController();


  late TextEditingController textEditingControllerDateTime;
  late TextEditingController textEditingControllerTeam1;
  late TextEditingController textEditingControllerTeam2;
  late TextEditingController textEditingControllerMatchType;
  late TextEditingController textEditingControllerDesc;
  late TextEditingController textEditingControllerStatus;



  bool isAddVisible = false;
  bool isUpdateVisible = false;

  MatchController matchController = Get.find();

  @override
  void initState() {
    super.initState();
    matchController.getAllMatch();
    textEditingControllerTeam1 = TextEditingController();
    textEditingControllerTeam2 = TextEditingController();
    textEditingControllerMatchType = TextEditingController();
    textEditingControllerDateTime = TextEditingController();
    textEditingControllerDesc = TextEditingController();
    textEditingControllerStatus = TextEditingController();
    // _dateController.text = DateFormat.yMd().format(DateTime.now());
    //
    // _timeController.text = formatDate(
    //     DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
    //     [hh, ':', nn, " ", am]).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Match'),
      //   automaticallyImplyLeading: false,
      // ),
      body: Obx(()=>isAddVisible
          ? Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: textEditingControllerTeam1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Team 1 Name ',
                      ),
                      onChanged: (String value) {
                        team1 = value;
                      },
                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: textEditingControllerTeam2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Team 2 Name',
                      ),
                      onChanged: (String value) {
                        team2 = value;
                      },
                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                      maxLength: 1,
                      controller: textEditingControllerMatchType,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Match Type 1=T20 2=ONE DAY 3=TEST',
                      ),
                      onChanged: (String value) {
                        matchType = value;
                      },
                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: TextField(
                        enabled: false,
                        controller: textEditingControllerDateTime,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Start Date',
                        ),
                        onChanged: (String value) {
                          matchType = value;
                        },
                      ),
                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectTime(context);

                      },
                      child: TextField(
                        enabled: false,
                        controller: timeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Start Time',
                        ),
                        onChanged: (String value) {
                          _selectTime(context);
                          matchType = value;
                          Text("${selectedTime.hour}:${selectedTime.minute}");

                        },

                      ),

                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                      maxLength: 60,
                      controller: textEditingControllerDesc,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Description',
                      ),
                      minLines: 5,
                      maxLines: 6,
                      onChanged: (String value) {
                        description = value;
                      },
                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                      maxLength: 1,
                      controller: textEditingControllerStatus,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                        'Status 1=Upcoming, 2=Ongoing, 3=Complete. 4=Cancel',
                      ),
                      onChanged: (String value) {

                        status = value;
                      },
                    )),
                const Expanded(child: Text("")),
                const Expanded(child: Text(""))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            FlatButton(
              child: Text(
                isUpdateVisible ? 'Update Match' : 'Add Match',
                style: const TextStyle(fontSize: 16.0),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () async {
                if (isUpdateVisible) {
                  int result = await updateMatch();
                  if (result == 1) {
                    matchController.getAllMatch();
                    isAddVisible = false;
                    isUpdateVisible = false;
                  }
                } else {
                  Map<String, String> result =
                  await matchController.addMatch(team1, team2,
                      matchType, startDate, description, status);
                  if (result['status'] == "1") {
                    matchController.getAllMatch();
                    isAddVisible = false;
                    isUpdateVisible = false;
                    showSnackBar(context, result['message']!);
                  } else {
                    showSnackBar(context, result['message']!);
                  }
                }
              },
            ),
          ],
        ),
      )
          : ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.all(4),
            color: Colors.black,
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                      "Match",
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    child: Text("Match Type",
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text("Date & Time",
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text("Description",
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text("Status",
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text("Action",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: matchController.arrOfMatch.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    padding: const EdgeInsets.all(4),
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(matchController.arrOfMatch[index].team1! +
                              " v/s " +
                              matchController.arrOfMatch[index].team2!),
                        ),
                        Expanded(
                            child: Text(matchController.arrOfMatch[index].matchType!.toString()=="1"?"T20":matchController.arrOfMatch[index].matchType!.toString()=="2"?"ONEDAY":matchController.arrOfMatch[index].matchType!.toString()=="3"?"TEST":matchController.arrOfMatch[index].matchType!.toString()=="4"?"T10":"")),
                        Expanded(child: Text(matchController.arrOfMatch[index].dateTime)),
                        Expanded(
                            child: Text(matchController.arrOfMatch[index].description!)),
                        Expanded(child: Text(matchController.arrOfMatch[index].status!.toString()=="1"?"UPCOMING":matchController.arrOfMatch[index].status!.toString()=="2"?"LIVE":matchController.arrOfMatch[index].status!.toString()=="3"?"FINISHED":"CANCEL")),
                        Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      matchId = matchController.arrOfMatch[index].matchId!;
                                      isUpdateVisible = true;
                                      textEditingControllerTeam1.text =
                                          matchController.arrOfMatch[index].team1 ?? "";
                                      isAddVisible = true;
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.edit)),
                                const SizedBox(
                                  width: 16,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      showConfirmDelete(context,index);
                                                                         },
                                    icon: const Icon(Icons.delete))
                              ],
                            )),
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(25),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isUpdateVisible) {
                isUpdateVisible = false;
              } else {
                isAddVisible = !isAddVisible;
                // if(isAddVisible){
                //   textEditingControllerTeam1.clear();
                //   textEditingControllerTeam2.clear();
                //   textEditingControllerMatchType.clear();
                //   textEditingControllerDateTime.clear();
                //   textEditingControllerDesc.clear();
                //   textEditingControllerStatus.clear();
                // }
              }
            });
          },
          child: isAddVisible || isUpdateVisible
              ? const Icon(Icons.arrow_back_rounded)
              : const Icon(Icons.add),
        ),
      ),
    );
  }

  Future showConfirmDelete(BuildContext context,int index){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () async {

                  int result = await deleteMatch(
                      matchController.arrOfMatch[index].matchId!);
                  if (result == 1) {
                    matchController.getAllMatch();
                  }

                  Navigator.of(context).pop(true);
                },
                child: const Text("DELETE")
            ),
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



  // DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        startDate = picked.toString();
        textEditingControllerDateTime.text = startDate;
      });
    }
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
        timeController.text= selectedTime.toString();
      });
    }
  }

  Future<int> updateMatch() async {
    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/match/updatematch'),
      body: {
        'match_id': matchId,
        'team1': team1,
        'team2': team2,
        'match_type': matchType,
        'start_date': startDate,
        'start_time': startTime,
        'description': description,
        'status': status,
      },
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

  Future<int> deleteMatch(String matchId) async {
    http.Response response = await http.post(
      Uri.parse('https://codinghouse.in/battingraja/match/deletematch'),
      body: {'match_id': matchId},
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
// Future showConfirmDelete(BuildContext context){
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//     return AlertDialog(
//       title: const Text("Confirm"),
//       content: const Text("Are you sure you wish to delete this item?"),
//       actions: <Widget>[
//         FlatButton(
//             onPressed: () {
//               Navigator.of(context).pop(true);
//             },
//             child: const Text("DELETE")
//         ),
//         FlatButton(
//           onPressed: () {
//             Navigator.of(context).pop(false);
//           },
//           child: const Text("CANCEL"),
//         ),
//       ],
//     );
//   });
// }
