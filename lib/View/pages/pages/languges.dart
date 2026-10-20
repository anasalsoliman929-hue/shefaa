import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';
import 'package:shefaa/controller/maincontroler.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  setindexlangugus(int index) async {
    SharedPreferences indexlangug = await SharedPreferences.getInstance();
    indexlangug.setInt("indexlang", index);
    print(" indexlangug is saved ");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colbg,
          iconTheme: IconThemeData(color: coltext),
          actionsIconTheme: IconThemeData(color: coltext),
          title: thetext(
            text: 'the langugus',
            sizetext: 20,
          ),
        ),
        body: AnimatedContainer(
          color: colbg,
          duration: const Duration(
            milliseconds: 500,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RadioListTile<int>(
                title: Text(
                  'العربية',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: coltext,
                  ),
                ),
                value: 0,
                groupValue: indexlang,
                onChanged: ((value) {
                  setState(() {
                    indexlang = value!;
                    setindexlangugus(value!);
                    theTextDecoration = TextDirection.rtl;
                    Get.appUpdate();
                    Changthem("false");
                  });
                }),
              ),
              RadioListTile<int>(
                title: Text(
                  'English',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: coltext,
                  ),
                ),
                value: 1,
                groupValue: indexlang,
                onChanged: ((value) {
                  setState(() {
                    indexlang = value!;
                    setindexlangugus(value!);
                    theTextDecoration = TextDirection.ltr;
                    Get.appUpdate();
                    Changthem("false");
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
