import 'package:dashboard_ui/last_digit_contest/page/update_ldc_contest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'last_digit_contest/create_ldc_contest.dart';

class PlayerSelectedContest extends StatefulWidget {
  const PlayerSelectedContest({Key? key}) : super(key: key);

  @override
  _PlayerSelectedContestState createState() => _PlayerSelectedContestState();
}

class _PlayerSelectedContestState extends State<PlayerSelectedContest> {
  bool isAddVisible = false;
  bool isUpdateVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white30,
      // appBar: AppBar(
      //   backgroundColor: Colors.yellow,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.search),
      //     )
      //   ],
      //   title: Text("last digit contest"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isAddVisible
            ? const CreateContest()
            : isUpdateVisible
            ? const UpdateLDContest()
            : GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 2 / 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: List.generate(15, (index) {
            return Container(
              padding: const EdgeInsets.all(8),
              // margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8),
                // boxShadow: [
                //   new BoxShadow(
                //     color: Colors.green,
                //     offset: new Offset(6.0, 6.0),
                //   ),
                // ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Match: IND v/s PAK",
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("Match Type:",
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("User Name:",
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("Entry Fees:",
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Text("Winning Amount:",
                        style: TextStyle(fontSize: 12),
                        textAlign: (TextAlign.start)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isUpdateVisible = true;
                              });
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              showConfirmDelete(context);
                            },
                            icon: Icon(Icons.delete)),
                        // Icon(Icons.preview)
                      ],
                    ),
                  ]),
            );
          }),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(25),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isUpdateVisible) {
                isUpdateVisible = false;
              } else {
                isAddVisible = !isAddVisible;
              }
            });
          },
          child:
          isAddVisible || isUpdateVisible
              ? Icon(Icons.arrow_back_rounded)
              : Icon(Icons.add),
        ),
      ),

    );
  }


  Future showConfirmDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
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

}