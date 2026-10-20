import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shefaa/View/pages/widgets/text.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
   File? image;
  final imagepicker = ImagePicker();
  uploadeimage() async {
    var pickedimage = await imagepicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedimage != null) {
      setState(() {
        image = File(pickedimage.path);
      });
    } else {
      print('eror');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: uploadeimage,
            child: thetext(text: 'image', sizetext: 25),
          ),
          image == null ? Text('data') : Image.file(image!),
        ],
      ),
    );
  }
}
