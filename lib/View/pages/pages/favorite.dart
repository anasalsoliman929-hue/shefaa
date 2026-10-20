import 'package:flutter/material.dart';
import 'package:shefaa/Model/like.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/widgets/item.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: theTextDecoration,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: colbgim,
        body: Padding(
          padding: EdgeInsets.only(
            right: 5,
          ),
          child: FutureBuilder<List<ModuleMedicine>>(
            future: Like().getAllLikeMedicinesService(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error');

                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                print('hasData');

                List<ModuleMedicine> Proudect = snapshot.data!;
                return Proudect.length != 0
                    ? ListView.builder(
                        itemCount: Proudect.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return item(
                            id: index.toString(),
                            moduleMedicine: Proudect[index],
                          );
                        },
                      )
                    : Center(
                        child: thetext(
                          text:langugus[indexlang]['thispageisempoty'] ,
                          sizetext: 30,
                        ),
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
      )),
    );
  }
}
