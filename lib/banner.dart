import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:http/http.dart' as http;

import 'add_banner.dart';
import 'last_digit_contest/controller/banner_controller.dart';
import 'model/model_banner.dart';

class Banner1 extends StatefulWidget {
  const Banner1({Key? key}) : super(key: key);

  @override
  _Banner1State createState() => _Banner1State();
}

class _Banner1State extends State<Banner1> {
  BannerController bannerController = Get.find();
  var arrOfBanner;

  @override
  void initState() {
    super.initState();
    bannerController.getAllBanner();
    bannerController.isAddVisible.value = false;
    // ldcController.isUpdateVisible.value = false;
    // ldcController.isViewVisible.value = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Obx(() => Padding(
          padding: const EdgeInsets.all(0),

          child: bannerController.isAddVisible.value
              ?Addbanner()

              :
              // ? const UpdateLDContest()
              // : ldcController.isViewVisible.value
              // ? const LDCResult()
              // : ldcController.isLoading.value
          //     ? const Center(
          //   child: CircularProgressIndicator(),
          // )
             ListView(
            children: [
              Container(
                height: 100,
                width: Get.width,
                color: Colors.white,
              ),
              DataTable(
                  headingTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 2.0),
                  columnSpacing: 32,
                  columns: [
                    DataColumn(
                        label: Text("No".toUpperCase())),

                    DataColumn(
                        label:
                        Text("title".toUpperCase())),
                    DataColumn(
                        label: Text(
                            "image".toUpperCase())),

                  ],
                  rows: List<DataRow>.generate(
                      bannerController.arrOfBanner.length, (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 1).toString())),

                      DataCell(Text((bannerController
                          .arrOfBanner[index].titile)
                          .toString())),
                      DataCell(Image.network(
                        bannerController
                            .arrOfBanner[index].image!,


                      ) ) ]);
                  }))
            ],
          ))),
      floatingActionButton: Obx(() => bannerController.isAddVisible.value
          ? const SizedBox.shrink()
          : Container(
        margin: const EdgeInsets.all(25),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            bannerController.isAddVisible.value = true;

          },
          child: const Icon(Icons.add),
        ),
      )),

    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   centerTitle: true,
    //   //   title: const Text('IMAGE PICKER'),
    //   // ),
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       const SizedBox(
    //         height: 50,
    //       ),
    //       Align(
    //         alignment: Alignment.center,
    //         child: Stack(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 border: Border.all(color: Colors.indigo, width: 5),
    //                 borderRadius: const BorderRadius.all(
    //                   Radius.circular(100),
    //                 ),
    //               ),
    //               child: ClipOval(
    //                 child: selectedImage == null?
    //                     Image.network(
    //                       'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
    //                       width: 170,
    //                       height: 170,
    //                       fit: BoxFit.cover,
    //                     ):Image.memory(selectedImage!),
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               right: 5,
    //               child: IconButton(
    //                 onPressed: () {
    //                   pickImage(ImageSource.gallery);
    //                 },
    //                 icon: const Icon(
    //                   Icons.add_a_photo_outlined,
    //                   color: Colors.blue,
    //                   size: 30,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ElevatedButton.icon(
    //             onPressed: () {
    //               pickImage(ImageSource.gallery);
    //             },
    //             icon: const Icon(Icons.add_a_photo_sharp),
    //             label: const Text('UPLOAD banner')),
    //       )
    //     ],
    //   ),
    // );
  }

  // Uint8List? selectedImage;
  // String base64Image="";
  //
  // pickImage(ImageSource imageType) async {
  //   setState(() async {
  //     Uint8List? selectedImage = await ImagePickerWeb.getImageAsBytes();
  //     base64Image=base64Encode(selectedImage!);
  //   });
  // }

}
