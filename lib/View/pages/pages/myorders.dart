import 'package:flutter/material.dart';
import 'package:shefaa/Model/apimyorder.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/modul_myorder.dart';
import 'package:shefaa/Model/module_order.dart';
import 'package:shefaa/View/pages/pages/login.dart';
import 'package:shefaa/View/pages/widgets/cardofmyorder.dart';
import 'package:shefaa/controller/data/variable.dart';

class myorder extends StatelessWidget {
  const myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colbgim,
        body: FutureBuilder(
          future: UeserLogin().getAllOrder(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');

              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              print('hasData');

              List<ModuleOrder> Proudect = snapshot.data!;
              return ListView.builder(
                itemCount: Proudect.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return cardofmyorder(
                    moduleOrder: Proudect[index],
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
        ));
  }
}
