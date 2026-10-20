import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/View/pages/pages/homePage.dart';
import 'package:shefaa/View/pages/pages/setting.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/maincontroler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Changthem controler = Get.put(Changthem('false'));
  getindexlangugus() async {
    SharedPreferences indexlangug = await SharedPreferences.getInstance();
    indexlang = indexlangug.getInt("indexlang") == null
        ? 0
        : indexlangug.getInt("indexlang")!;

    print(indexlang);
    if (indexlang == 0 && indexlang != null) {
      theTextDecoration = TextDirection.rtl;
    } else if (indexlang == 1 && indexlang != null) {
      theTextDecoration = TextDirection.ltr;
    } else {
      indexlang = 0;
      theTextDecoration = TextDirection.rtl;
    }
  }

  @override
  Widget build(BuildContext context) {
    getindexlangugus();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controler.theme,
      title:langugus[indexlang]['shefaa'] ,
      home: splashscren(),
    );
  }
}
