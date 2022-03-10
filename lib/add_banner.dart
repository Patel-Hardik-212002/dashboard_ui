import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class Addbanner extends StatefulWidget {
  const Addbanner({Key? key}) : super(key: key);

  @override
  _AddbannerState createState() => _AddbannerState();
}

class _AddbannerState extends State<Addbanner> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: const Text('Addbanner'),
          // ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipOval(
                        child: selectedImage == null?
                            Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ):Image.memory(selectedImage!),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          pickImage(ImageSource.gallery);
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 200,width: 30,
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:Get.width*0.30),


                child: ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },

                    icon: const Icon(Icons.add_a_photo_sharp),

                    label: const Text('UPLOAD banner')
                ),

              ),
            SizedBox(width: 30,height: 10),
            ],
          ),
        );
        }

  Uint8List? selectedImage;
  String base64Image="";

  pickImage(ImageSource imageType) async {
    setState(() async {
      Uint8List? selectedImage = await ImagePickerWeb.getImageAsBytes();
      base64Image=base64Encode(selectedImage!);
    });
  }

}

