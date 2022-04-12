import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: Icon(Icons.local_airport,color: Colors.black,size: 200,),
      ),
    );
  }

  void startTimer(){
    Future.delayed(const Duration(seconds: 2),(){
      Get.off(Home());
    });

  }
}
