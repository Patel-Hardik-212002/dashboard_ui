import 'package:flutter/material.dart';

class TossResult extends StatefulWidget {
  const TossResult({Key? key}) : super(key: key);

  @override
  _TossResultState createState() => _TossResultState();
}

class _TossResultState extends State<TossResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text("USER NAME".toUpperCase(),style: TextStyle(color: Colors.white),)),
                  HDivier(),
                  Expanded(child: Text("SELECTED DIGIT NUMBER".toUpperCase(),style: TextStyle(color: Colors.white),)),
                  HDivier(),

                ],
              ),
            ),
            ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("nens".toUpperCase()),
                      SizedBox(
                        width: 650,
                      ),
                      Text("9".toUpperCase()),
                      SizedBox(
                        width: 286,
                      ),
                    ],
                  );
                })
          ],
        )
    );
  }
  Widget HDivier(){
    return Container(
      width: 1,
      height: 30,
      color: Colors.white,
    );
  }

}
