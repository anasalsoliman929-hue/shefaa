import 'package:flutter/material.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/pages/languges.dart';
import 'package:shefaa/View/pages/widgets/payitem.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

//Map<String, dynamic>
late List<Map<String, dynamic>> orderprodects =
    []; // Declare orderprodects as List<Map<String, dynamic>>

// ... rest of the code remains the same
class mashtraeat extends StatefulWidget {
  mashtraeat({super.key});

  @override
  State<mashtraeat> createState() => _mashtraeatState();
}

class _mashtraeatState extends State<mashtraeat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colbgim,
        appBar: AppBar(
          backgroundColor: colbg,
          actionsIconTheme: IconThemeData(color: coltext),
          title: thetext(
            text: langugus[indexlang]['purchases'],
            sizetext: 25,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: coltext),
          actions: [
            InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: thetext(
                    text: langugus[indexlang]['send'],
                    sizetext: 22,
                  ),
                ),
              ),
              onTap: () async {
                List<Map<String, dynamic>> nonZeroProducts = orderprodects
                    .where((product) => product['amount'] > 0)
                    .toList();

                await UeserLogin().userPostOrder(body: nonZeroProducts);

                Navigator.of(context).pop();
                setState(() {
                  orderprodects.clear();
                });
              },
            ),
          ],
        ),
        body: FutureBuilder<List<ModuleMedicine>>(
          future: UeserLogin().getAllMedicinesService(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              print('hasData');
              List<ModuleMedicine> Proudect = snapshot.data!;
              return ListView.builder(
                itemCount: Proudect.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  ModuleMedicine aa = Proudect[index];
                  int existingIndex =
                      // ignore: avoid_types_as_parameter_names
                      orderprodects.indexWhere((item) => item['id'] == aa.id);
                  if (existingIndex != -1) {
                  } else {
                    // Map with the ID does not exist, add a new map
                    orderprodects.add({
                      "id": aa.id,
                      "amount": 0,
                    });
                  }
                  // print(orderprodects);
                  // return Text('data');
                  return payitem(
                    Id: index,
                    moduleMedicine: Proudect[index],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  //  value: 7,
                  strokeWidth: 3,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
