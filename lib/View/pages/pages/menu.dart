import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/widgets/item.dart';
import 'package:shefaa/controller/data/variable.dart';

ScrollController menucontroler = ScrollController(
  initialScrollOffset: 0.0,
  keepScrollOffset: true,
);

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: colbgim,
        body: Padding(
          padding: EdgeInsets.only(
            right: 5,
          ),
          child: FutureBuilder<List<ModuleMedicine>>(
            future: UeserLogin().getAllMedicinesService(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error');

                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                print('hasData');

                List<ModuleMedicine> Proudect = snapshot.data!;
                return ListView.builder(
                  controller: menucontroler,
                  itemCount: Proudect.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return item(
                      id: index.toString(),
                      moduleMedicine: Proudect[index],
                    );
                  },
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  //  value: 7,
                  strokeWidth: 3,
                ));
              }
            },
          ),
        ),

        //
      ),
    );
  }
}
