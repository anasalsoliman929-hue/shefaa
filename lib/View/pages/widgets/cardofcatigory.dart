import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/View/pages/pages/midecinofcatigory.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/variable.dart';

class cardcatigory extends StatelessWidget {
  cardcatigory({
    super.key,
    required this.nameofcatgry,
  });
  String nameofcatgry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        child: Card(
          color: colbg,
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: thetext(
                text: nameofcatgry.toString(),
                sizetext: 25,
              ),
            ),
          ),
        ),
        onTap: () {
          Get.to(
            Midecinofcatigory(
              nameofcatgry: nameofcatgry,
            ),
          );
        },
      ),
    );
  }
}
