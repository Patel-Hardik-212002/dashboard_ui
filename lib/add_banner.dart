import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'last_digit_contest/controller/banner_controller.dart';

class AddBanner extends StatefulWidget {
  const AddBanner({Key? key}) : super(key: key);

  @override
  _AddBannerState createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  String title = "";
  BannerController bannerController = Get.find();
  late TextEditingController textEditingControllerTitle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingControllerTitle=TextEditingController();

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
              bannerController.isUpdateVisible.value = false;
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Upload Banner".toUpperCase(),
            style: const TextStyle(
                letterSpacing: 2.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          centerTitle: true,
        ),
        body:
      Column(
        children: [
          SizedBox(
            height: 60,
            width: Get.width * 0.30,
            child: TextField(
              controller: textEditingControllerTitle,
              maxLength: 10,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.digitsOnly
              // ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),          SizedBox(
            height: 60,
            width: Get.width * 0.30,
            child: TextField(
              enabled: false,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'select banner',
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          SizedBox(
            // height: 60,
            width: Get.width * 0.30,
            child: Container(
              height: 250,

              color: Colors.black,

              ),
            ),
        SizedBox(
          height: 60,
        ),
          Material(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () async {
                // Map<String, String> result =
                // await bannerController.updateContest(
                //                     contestName.text,
                //   textEditingControllerEntryFee.text,
                //   winningAmount.text,
                //   description.text,
                //   textEditingControllerInningType.text,
                //   inningScore.text,
                // );
                // if (result['status'] == "1") {
                //   showSnackBar(context, result['message']!);
                //   ldcController.isUpdateVisible.value = false;
                //   Get.to(Home(
                //     position: 1,
                //   ));
                // } else {
                //   showSnackBar(context, result['message']!);
                // }
              },
              child: SizedBox(
                width: 100,
                height: 40,
                child: Center(
                  child: bannerController.isLoading.value
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text(
                    "Upload",
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 1.0),
                  ),
                ),
              ),
            ),
          ),

         ],
      )
    );


    // Align(
    //   alignment: Alignment.center,
    //   child: Stack(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           border: Border.all(color: Colors.indigo, width: 5),
    //           // borderRadius: const BorderRadius.all(
    //           //   Radius.circular(100),
    //           // ),
    //         ),
    //         child: ClipOval(
    //           child: selectedImage == null?
    //               Image.network(
    //                 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
    //                 width: 170,
    //                 height: 170,
    //                 fit: BoxFit.cover,
    //               ):Image.memory(selectedImage!),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 0,
    //         right: 5,
    //         child: IconButton(
    //           onPressed: () {
    //             pickImage(ImageSource.gallery);
    //           },
    //           icon: const Icon(
    //             Icons.add_a_photo_outlined,
    //             color: Colors.blue,
    //             size: 30,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // const SizedBox(
    //   height: 200,width: 30,
    // ),
    //             Padding(
    //               padding:EdgeInsets.symmetric(horizontal:Get.width*0.30),
    //
    //
    //               child: ElevatedButton.icon(
    //                   onPressed: () {
    //                     pickImage(ImageSource.gallery);
    //                   },
    //
    //                   icon: const Icon(Icons.add_a_photo_sharp),
    //
    //                   label: const Text('UPLOAD banner')
    //               ),
    //
    //             ),
    //           SizedBox(width: 30,height: 10),
    //           ],
    //         ),
    //       );
    //       }
    //
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
}
