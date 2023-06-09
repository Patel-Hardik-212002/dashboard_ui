import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/binding_controller.dart';
import 'page/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      initialBinding: BindingController(),
    );
  }
}
