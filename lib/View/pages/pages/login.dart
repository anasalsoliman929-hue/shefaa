// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/View/pages/pages/homePage.dart';
import 'package:shefaa/View/pages/pages/create_acount.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

// import 'package:image_picker/image_picker.dart';
IconData? iconpass = Icons.visibility;
bool hidenpass = true;

class login extends StatefulWidget {
  login({super.key});
  int x = 0;
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with TickerProviderStateMixin {
  savevaleodlogin() async {
    SharedPreferences bollogin = await SharedPreferences.getInstance();
    bollogin.setBool("islogin", true);
    print('is saved');
  }

  savetoken() async {
    SharedPreferences thetoken = await SharedPreferences.getInstance();
    if(token!=null){
    thetoken.setString("thetoken", token!);
    print('thetoken is saved');
     print(token);}
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: theTextDecoration,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: colbg,
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: colbg,
            child: SingleChildScrollView(
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
                            color: Colors.blue,
                            width: 5,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/logo.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: colbg),
                      validator: (value) {
                        Colors.amber;
                        return !GetUtils.isEmail(value!)
                            ? 'not_valid_email'
                            : null;
                      },
                      decoration: InputDecoration(
                        fillColor: coltext,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 234, 211, 6),
                        ),
                        hintText: langugus[indexlang]['gmail'],
                        // labelText: langugus[indexlang]['gmail'],
                        hintStyle: TextStyle(color: colbg),
                        // labelStyle: TextStyle(color: colbg),
                      ),
                      onTap: () {},
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      obscureText: hidenpass,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: colbg),
                      validator: (value) {
                        if (value!.isNotEmpty && value!.length > 7) {
                          print(value);
                          return null;
                        } else {
                          return text1();
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: coltext,
                        filled: true,
                        hintText: langugus[indexlang]['password'],
                        // labelText: langugus[indexlang]['password'],
                        suffixIconColor: Color.fromARGB(255, 3, 68, 121),
                        hintStyle: TextStyle(color: colbg),
                        //  labelStyle: TextStyle(color: colbg),
                        suffixIcon: InkWell(
                          child: IconButton(
                            icon: Icon(
                              iconpass,
                            ),
                            onPressed: () {
                              setState(() {
                                if (hidenpass == true) {
                                  iconpass = Icons.visibility_off;
                                  hidenpass = false;
                                } else {
                                  iconpass = Icons.visibility;

                                  hidenpass = true;
                                }
                              });
                            },
                          ),
                          onLongPress: () {
                            setState(() {
                              iconpass = Icons.visibility_off;
                              hidenpass = false;
                            });

                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                setState(() {
                                  iconpass = Icons.visibility;
                                  hidenpass = true;
                                });
                              },
                            );
                          },
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                      ),
                      onTap: () {},
                      onChanged: (value) {},
                      onEditingComplete: () {},
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      ///////////////////////////////////////////////
                      if (_formKey.currentState!.validate()) {
                        await Future.delayed(
                          Duration(
                            seconds: 3,
                          ),
                          () {},
                        );
                        if (await UeserLogin().UserLogin(
                                email: email!, password: password!) ==
                            401) {
                          print("Eamil not found!");
                        }

                        if (await UeserLogin().UserLogin(
                                email: email!, password: password!) ==
                            402) {
                          print("Incorrect Password!");
                        } else {
                          savetoken();

                          Get.to(homePage());
                          savevaleodlogin();
                        }
                      }

                      // // ScaffoldMessenger.of(context).showSnackBar(
                      // //   const SnackBar(
                      // //       content: Text('المعلومات التي ادخلتها خاطئة')),
                      // // );
                    },
                    icon: const Icon(Icons.login, size: 30),
                    label: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        langugus[indexlang]['login'],
                        style: TextStyle(
                          color: coltext,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        langugus[indexlang]['ifyoudonthaveacount'],
                        style: TextStyle(
                          color: coltext,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Text(
                          langugus[indexlang]['clickhere'],
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAcount(),
                            ),
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //       'المعلومات التي ادخلتها خاطئة',
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

text1() {
  return 'error the phone is nt corret';
}
