import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

class profile extends StatefulWidget {
 const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with TickerProviderStateMixin {
  File? image;
  final imagepicker = ImagePicker();
  uploadeimagefromgallery() async {
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

  uploadeimagefromcamera() async {
    var pickedimage = await imagepicker.pickImage(
      source: ImageSource.camera,
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
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colbgim,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: coltext,
                          width: 2,
                        ),
                        image: image == null
                            ? const DecorationImage(
                                image: AssetImage('assets/logo.jpg'),
                                fit: BoxFit.fill,
                              )
                            : DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                          isScrollControlled: true,
                          constraints: const BoxConstraints.tightFor(
                            height: 200,
                          ),
                          transitionAnimationController: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 250),
                            reverseDuration: const Duration(milliseconds: 250),
                          ),
                          builder: (context) {
                            return Directionality(
                              textDirection: theTextDecoration,
                              child: Container(
                                decoration:  BoxDecoration(
                                  color: colbg,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(
                                      40,
                                    ),
                                  ),
                                ),
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Center(
                                        child: Text(
                                          'اختر المكان الذي تريد منه سحب الصور'
                                          // infopeople[MYID]
                                          //     ['username']
                                          ,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: coltext,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color:
                                          colbg,
                                      child: ListTile(
                                        title: Text(
                                          'الاستديو'
                                          // infopeople[MYID]
                                          //     ['username']
                                          ,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: coltext,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.camera_alt,
                                          color: coltext,
                                          size: 50,
                                        ),
                                        onTap: () {
                                          uploadeimagefromgallery();
                                        },
                                      ),
                                    ),
                                    Card(
                                      color:
                                          colbg,
                                      child: ListTile(
                                        title: Text(
                                          'الكميرا'
                                          // infopeople[MYID]
                                          //     ['username']
                                          ,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: coltext,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.mms_outlined,
                                          color: coltext,
                                          size: 50,
                                        ),
                                        onTap: () {
                                          uploadeimagefromcamera();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: coltext,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 15,
                  ),
                  child: Container(
                    child: thetext(
                      text: 'Anas Alsuleiman',
                      sizetext: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: Container(
                    child: thetext(
                      text: 'Anas Alsuleiman',
                      sizetext: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
