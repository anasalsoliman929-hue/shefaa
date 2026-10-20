import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/modul_myorder.dart';
import 'package:shefaa/Model/module_order.dart';
import 'package:shefaa/View/pages/widgets/detailsofmyorder.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/controller/data/variable.dart';

class cardofmyorder extends StatelessWidget {
  cardofmyorder({
    super.key,
    required this.moduleOrder,
  });
  ModuleOrder moduleOrder;
  @override
  Widget build(BuildContext context) {
    // print(modul_myorder.);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: colbg,
        child: InkWell(
          child: Container(
            child: Column(
              children: [
                thetext(
                  text: '${langugus[indexlang]['totalprice']} ${moduleOrder.total_price}',
                  sizetext: 25,
                ),
                thetext(
                  text: '${langugus[indexlang]['status']}  ${moduleOrder.status}',
                  sizetext: 25,
                ),
                thetext(
                  text: moduleOrder.paid == 0 ? '${langugus[indexlang]['NotPaid']}' : '${langugus[indexlang]['Paid']}',
                  sizetext: 25,
                ),
              ],
            ),
          ),
          onTap: () {
            Get.to(
              detailsofmyorder(
                id: moduleOrder.id.toString(),
              ),
            );
          },
        ),
      ),
    );
  }
}
// langugus[indexlang]['totalofprodect']