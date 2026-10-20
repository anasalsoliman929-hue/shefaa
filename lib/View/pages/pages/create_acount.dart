import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/View/pages/pages/homePage.dart';
import 'package:shefaa/View/pages/pages/login.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

IconData? iconpassword = Icons.visibility;
bool hidenpassword = true;
String? nameuser = '';
String? password = '';
String? email = '';

class CreateAcount extends StatefulWidget {
  const CreateAcount({super.key});

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  savevaleodlogin() async {
    SharedPreferences bollogin = await SharedPreferences.getInstance();
    bollogin.setBool("islogin", true);
    print('is saved');
  }

  savetoken() async {
    SharedPreferences thetoken = await SharedPreferences.getInstance();
    thetoken.setString("thetoken", token!);
    print('thetoken is saved');
    print(token);
  }

  final _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: theTextDecoration,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colbg,
          body: Form(
            key: _formKey1,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        'assets/logo.jpg',
                      ),
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
                          labelText: langugus[indexlang]['gmail'],
                          hintStyle: TextStyle(color: coltext),
                          // labelStyle: TextStyle(
                          //   color: text
                          // ),
                        ),
                        onTap: () {
                          // Get.height;
                        },
                        onChanged: (value) {
                          email = value;
                          print(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.send,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: colbg),
                        validator: (value) {
                          return !GetUtils.isUsername(value!)
                              ? 'not_valid_Username'
                              : null;
                        },
                        decoration: InputDecoration(
                          fillColor: coltext,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.health_and_safety,
                            color: Color.fromARGB(255, 234, 211, 6),
                          ),
                          labelText: langugus[indexlang]['name'],
                          hintStyle: TextStyle(color: coltext),
                          // labelStyle: TextStyle(
                          //   color: text
                          // ),
                        ),
                        onTap: () {},
                        onChanged: (value) {
                          nameuser = value;
                          print(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        obscureText: hidenpassword,
                        style: TextStyle(color: colbg),
                        validator: (value) {
                          return (value!.length < 8)
                              ? 'cant_be_less_than_8_letter'
                              : null;
                        },
                        decoration: InputDecoration(
                          fillColor: coltext,
                          filled: true,
                          hintText: '',
                          labelText: langugus[indexlang]['password'],
                          suffixIconColor:
                              const Color.fromARGB(255, 3, 68, 121),
                          hintStyle: TextStyle(color: coltext),
                          suffixIcon: InkWell(
                            child: IconButton(
                              icon: Icon(
                                iconpassword,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (hidenpass == true) {
                                    iconpassword = Icons.visibility_off;
                                    hidenpassword = false;
                                  } else {
                                    iconpassword = Icons.visibility;

                                    hidenpassword = true;
                                  }
                                });
                              },
                            ),
                            onLongPress: () {
                              setState(() {
                                iconpassword = Icons.visibility_off;
                                hidenpassword = false;
                              });

                              Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  setState(() {
                                    iconpassword = Icons.visibility;
                                    hidenpassword = true;
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
                        onChanged: (value) {
                          password = value;
                        },
                        onEditingComplete: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey1.currentState!.validate()) {
                          await UeserLogin().userRegister(
                            name: nameuser!,
                            email: email!,
                            password: password!,
                          );
                          if (token != "") {
                            savetoken();
                            Get.snackbar(
                              ' logind sucssfuly ',
                              " login ",
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  homePage(),
                              ),
                            );
                            // savevaleodlogin();
                          }
                        }
                        // // ScaffoldMessenger.of(context).showSnackBar(
                        // //   const SnackBar(
                        // //       content: Text('المعلومات التي ادخلتها خاطئة')),
                        // // );
                      },
                      icon: const Icon(Icons.login, size: 35),
                      label: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          langugus[indexlang]['singin'],
                          style: TextStyle(
                            color: coltext,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          langugus[indexlang]['ifyouhaveacount'],
                          style: TextStyle(
                            color: coltext,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
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
                                builder: (context) => login(),
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
        ),
      ),
    );
  }
}
