import 'dart:convert';

import 'package:dashboard_ui/model/model_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  RxList<ModelUser> arrOfUser = <ModelUser>[].obs;
  void initState() {
    // TODO: implement initState
    getAllUser();
    super.initState();

    // ldcController.getAllLDC();
    // textEditingControllerScore = TextEditingController();
    // textEditingControllercontestname = TextEditingController();
    // textEditingControllerentryfee = TextEditingController();
    // textEditingControllerwiningamount = TextEditingController();
    // textEditingControllerdescription = TextEditingController();
    // ldcController.isAddVisible=false;
    // ldcController.isUpdateVisible=false;
    // ldcController.isViewVisible=false;
    // // textEditingControllerStatus = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text("No".toUpperCase(),style: TextStyle(color: Colors.white),)),
              HDivier(),
              Expanded(child: Text("Name".toUpperCase(),style: TextStyle(color: Colors.white),)),
    HDivier(),
              Expanded(child: Text("Mobile Number".toUpperCase(),style: TextStyle(color: Colors.white),)),
              HDivier(),
              Expanded(child: Text("Email_id".toUpperCase(),style: TextStyle(color: Colors.white),)),
              HDivier(),
              Expanded(child: Text("Level".toUpperCase(),style: TextStyle(color: Colors.white),)),
              HDivier(),
              Expanded(child: Text("wallet".toUpperCase(),style: TextStyle(color: Colors.white),)),
              HDivier(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
              itemCount: arrOfUser.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(child: Text((index+1).toString().toUpperCase())),
                    HDivier(),
                    Expanded(child: Text(arrOfUser[index].name??"-")),
                    HDivier(),
                    Expanded(child: Text(arrOfUser[index].mobile??"-")),
                    HDivier(),
                    Expanded(child:  Text(arrOfUser[index].email??"-")),
                    HDivier(),
                    Expanded(child:  Text(arrOfUser[index].level??"-")),
                    HDivier(),
                    Expanded(child:  Text(arrOfUser[index].wallet??"-")),
                    HDivier(),
                  ],
                );
              }),
        )
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
  Future<void> getAllUser() async {
    arrOfUser.clear();
    http.Response response = await http.get(Uri.parse(
        'https://codinghouse.in/battingraja/user/getalluser'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      arrOfUser.addAll((json as List)
          .map((e) => ModelUser.fromJson(e as Map<String, dynamic>)));
      setState(() {

      });
    }
  }

}
