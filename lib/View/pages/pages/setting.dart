import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/View/pages/pages/create_acount.dart';
import 'package:shefaa/View/pages/pages/languges.dart';
import 'package:shefaa/View/pages/pages/login.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/View/pages/pages/modeofapp.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

class setting extends StatelessWidget {
  const setting({super.key});
  @override
  Widget build(BuildContext context) {
    savevaleodlogin() async {
      SharedPreferences bollogin = await SharedPreferences.getInstance();
      bollogin.setBool("islogin", false);
      print('login is saved');
    }
    return Directionality(
      textDirection: theTextDecoration,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colbgim,
          body: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: coltext,
                  size: 30,
                ),
                title: thetext(
                  text: langugus[indexlang]['darkandlightmode'],
                  sizetext: 17,
                ),
                onTap: () {
                  Get.to(modeofapp());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: coltext,
                  size: 30,
                ),
                title: thetext(
                  text: langugus[indexlang]['language'],
                  sizetext: 17,
                ),
                onTap: () {
                  Get.to(language());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle_sharp,
                  color: coltext,
                  size: 30,
                ),
                title: thetext(
                  text: langugus[indexlang]['account'],
                  sizetext: 17,
                ),
                onTap: () {
                  // Get.to(modeofapp());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: coltext,
                  size: 30,
                ),
                title: thetext(
                  text: langugus[indexlang]['logout'],
                  sizetext: 17,
                ),
                onTap: () async {
                  // Get.snackbar('mc;sc', 'mdvm;');
                  savevaleodlogin();

                  await UeserLogin()
                      .UserLogout(email: email!, password: password!);
                  Get.to(login());

                  // Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
