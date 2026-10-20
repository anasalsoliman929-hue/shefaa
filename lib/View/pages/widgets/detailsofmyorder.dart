import 'package:flutter/material.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/modul_myorder.dart';
import 'package:shefaa/Model/module_order.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/View/pages/widgets/cardditailsmyorder.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

class detailsofmyorder extends StatelessWidget {
  detailsofmyorder({
    super.key,
    required this.id,
  });
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colbgim,
      appBar: AppBar(
        backgroundColor: colbg,
        actionsIconTheme: IconThemeData(color: coltext),
        title: thetext(
          text: langugus[indexlang]['orderditails'],
          sizetext: 25,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: coltext),
      ),
      body: FutureBuilder<List<Modul_myorder>>(
        future: UeserLogin().getOneOrder(id: id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error');
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            print('hasData');
            List<Modul_myorder> Proudect = snapshot.data!;
            return ListView.builder(
              itemCount: Proudect.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return cardditailsmyorder(
                  modul_myorder: Proudect[index],
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
    );
  }
}
