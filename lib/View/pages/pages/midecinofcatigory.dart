import 'package:flutter/material.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/widgets/item.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/variable.dart';

class Midecinofcatigory extends StatelessWidget {
  Midecinofcatigory({
    super.key,
    required this.nameofcatgry,
  });
  String nameofcatgry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colbgim,
      appBar: AppBar(
        backgroundColor: colbg,
        iconTheme: IconThemeData(color: coltext),
        centerTitle: true,
        actionsIconTheme: IconThemeData(
          color: coltext,
        ),
        title: thetext(
          text: nameofcatgry.toString(),
          sizetext: 25,
        ),
      ),
      body: FutureBuilder<List<ModuleMedicine>>(
        future: UeserLogin()
            .getAllMedicinesSearchOfCategory(category: nameofcatgry.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error');

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            print('hasData');

            List<ModuleMedicine> Proudect = snapshot.data!;
            return ListView.builder(
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
    );
  }
}
