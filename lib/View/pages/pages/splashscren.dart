import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/View/pages/pages/homePage.dart';
import 'package:shefaa/View/pages/pages/login.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

bool? islogin;
int? themode;
late int indexlang =0;
TextDirection theTextDecoration = TextDirection.rtl;
class splashscren extends StatelessWidget {
  const splashscren({super.key});

  @override
  Widget build(BuildContext context) {
    heightscr = MediaQuery.of(context).size.height;
    widthscr = MediaQuery.of(context).size.width;
    getdatafromsherdprefrns() async {
      SharedPreferences bollogin = await SharedPreferences.getInstance();
      islogin = bollogin.getBool("islogin");
    }

    getinexofthem() async {
      SharedPreferences indexthem = await SharedPreferences.getInstance();
      themode = indexthem.getInt("indextheme");
      if (themode == 0) {
        coltext = Colors.black;
        colbg = Colors.white;
        colbgim = Color.fromARGB(255, 196, 195, 195);
      } else if (themode == 1) {
        coltext = Colors.white;
        colbg = Color.fromARGB(255, 48, 47, 47);
        colbgim = const Color.fromARGB(255, 66, 65, 65);
      } else {
        ///////////////////////////////////////////////////
      }
    }

   

    gettoken() async {
      SharedPreferences thetoken = await SharedPreferences.getInstance();
      token = thetoken.getString("thetoken");
      print('token is get');
      print(token);
    }

    Future.delayed(
      Duration(seconds: 5),
      () async {
        await getinexofthem();
        await getdatafromsherdprefrns();
        gettoken();
      
        if (islogin == null) {
          islogin = false;
        }
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => islogin! ? homePage() : login(),
          ),
        );
      },
    );
    return Directionality(
      textDirection: theTextDecoration,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: colbg,
            body: Container(
              width: widthscr,
              height: heightscr,
              child: Stack(
                children: [
                  Container(
                    height: heightscr,
                    child: Image.asset(
                      'assets/logo.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: widthscr,
                    height: heightscr,
                    padding: EdgeInsets.only(bottom: 40),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          langugus[indexlang]["shifaa"],
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 15),
                        CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
