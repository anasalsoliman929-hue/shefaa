import 'package:flutter/material.dart';
import 'package:shefaa/Model/modul_myorder.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/controller/data/variable.dart';

class cardditailsmyorder extends StatelessWidget {
  cardditailsmyorder({
    super.key,
    required this.modul_myorder,
  });
  Modul_myorder modul_myorder;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: colbg,
      child: Column(
        children: [
          thetext(
            text: '${modul_myorder.commercial_name}',
            sizetext: 25,
          ),
          thetext(
            text: '${langugus[indexlang]['amount']} : ${modul_myorder.amount}',
            sizetext: 25,
          ),
          thetext(
            text: '${langugus[indexlang]['totalprice']} ${modul_myorder.cost}',
            sizetext: 25,
          ),
        ],
      ),
    );
  }
}
