import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/widgets/image.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';

class infoitem extends StatefulWidget {
  infoitem({
    super.key,
    required this.iditem,
    required this.moduleMedicine,
  });
  final iditem;
  ModuleMedicine moduleMedicine;
  @override
  State<infoitem> createState() => _infoitemState();
}

class _infoitemState extends State<infoitem> with TickerProviderStateMixin {
  int numberofmidsen = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: theTextDecoration,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colbg,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: image(
                    theimage: 'assets/logo.jpg',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                thetext(
                  text: widget.moduleMedicine.scientificName,
                  sizetext: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                thetext(
                  text: widget.moduleMedicine.commercialName,
                  sizetext: 20,
                ),
                SizedBox(
                  height: 10,
                ),

                thetext(
                  /////
                  text: widget.moduleMedicine.manufactureCompany,
                  sizetext: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                thetext(
                  /////
                  text: widget.moduleMedicine.category,
                  sizetext: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                thetext(
                  /////
                  text: langugus[indexlang]['totalofprodect'] +
                      ' ' +
                      widget.moduleMedicine.availableQuantity.toString(),
                  sizetext: 20,
                ),
                thetext(
                    text: langugus[indexlang]['totalprice'] +
                        ' ' +
                        widget.moduleMedicine.price +
                        "  \$",
                    sizetext: 20),

                thetext(
                  /////
                  text: widget.moduleMedicine.expirationDate,
                  sizetext: 20,
                ),
                //  thetext(
                //   /////
                //   text: widget.moduleMedicine.image_url,
                //   sizetext: 20,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
