import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/controller/data/variable.dart';
import 'package:shefaa/controller/maincontroler.dart';

class modeofapp extends StatefulWidget {
  modeofapp({super.key});

  @override
  State<modeofapp> createState() => _modeofappState();
}

class _modeofappState extends State<modeofapp> {
  getinexofthem() async {
    SharedPreferences indexthem = await SharedPreferences.getInstance();
    themode = indexthem.getInt("indextheme");
  }

  setindexofthem(int index) async {
    SharedPreferences indexthem = await SharedPreferences.getInstance();
    indexthem.setInt("indextheme", index);
    print(" themode is saved ");
  }

  @override
  void initState() {
    getinexofthem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colbg,
        appBar: AppBar(
          backgroundColor: colbg,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.done,
                color: coltext,
              )),
          title: Text('Theme of app',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w900, color: coltext)),
          centerTitle: true,
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
                title: Text('light theme',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: coltext)),
                value: 0,
                groupValue: themode,
                onChanged: ((value) {
                  setindexofthem(value!);
                  setState(
                    () {
                      coltext = Colors.black;
                      colbg = Colors.white;
                      colbgim = Color.fromARGB(255, 196, 195, 195);

                      themode = value!;
                      Get.appUpdate();
                      Changthem("false");
                    },
                  );
                }),
              ),
              RadioListTile<int>(
                title: Text(
                  'dark theme',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: coltext,
                  ),
                ),
                value: 1,
                groupValue: themode,
                onChanged: ((value) {
                  setindexofthem(value!);
                  setState(
                    () {
                      coltext = Colors.white;
                      colbg = Color.fromARGB(255, 48, 47, 47);
                      colbgim = const Color.fromARGB(255, 66, 65, 65);
                      themode = value!;
                      Get.appUpdate();
                      Changthem("false");
                      //  theMode = ThemeMode.dark;
                    },
                  );
                }),
              ),
              RadioListTile<int>(
                title: Text(
                  'system theme',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: coltext,
                  ),
                ),
                value: 2,
                groupValue: themode,
                onChanged: ((value) {
                  setindexofthem(value!);
                  setState(
                    () {
                      themode = value!;
                      Get.appUpdate();
                      Changthem("false");
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
