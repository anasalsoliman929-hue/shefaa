import 'package:flutter/material.dart';
import 'package:shefaa/Model/apicatigory.dart';
import 'package:shefaa/View/pages/widgets/cardofcatigory.dart';
import 'package:shefaa/controller/data/variable.dart';

class catigory extends StatefulWidget {
  const catigory({super.key});

  @override
  State<catigory> createState() => _catigoryState();
}

class _catigoryState extends State<catigory> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colbgim,
      body: FutureBuilder(
        future: apicatigory().getAllLikeMedicinesService(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error');

            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            print('hasData');

            List<dynamic> thecatigory = snapshot.data!;
            return ListView.builder(
              itemCount: thecatigory.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return cardcatigory(
                  nameofcatgry: thecatigory[index],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                //  value: 7,
                strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }
}
