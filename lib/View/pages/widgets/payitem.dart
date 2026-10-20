import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/View/pages/pages/purchases.dart';
import 'package:shefaa/View/pages/widgets/image.dart';
import 'package:shefaa/View/pages/widgets/infoitem.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

class payitem extends StatefulWidget {
  payitem({
    super.key,
    required this.moduleMedicine,
    required this.Id,
  });
  ModuleMedicine moduleMedicine;

  int Id;
  @override
  State<payitem> createState() => _itemState();
}

class _itemState extends State<payitem> {
  bool isliked = false;
  int amountoforder = 0;
  @override
  Widget build(BuildContext context) {
    amountoforder = orderprodects[widget.Id]["amount"];
    return Directionality(
      textDirection: theTextDecoration,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: colbg,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  child: SizedBox(
                    child: Column(
                      children: [
                        ListTile(
                          title: thetext(
                              text: widget.moduleMedicine.scientificName,
                              sizetext: 20),
                          titleAlignment: ListTileTitleAlignment.center,
                          subtitle: thetext(
                            text: widget.moduleMedicine.commercialName,
                            sizetext: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: image(
                            theimage: 'assets/p${widget.Id.toString()}.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(infoitem(
                      iditem: widget.moduleMedicine.id,
                      moduleMedicine: widget.moduleMedicine,
                    ));
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: thetext(
                      text:
                          '${langugus[indexlang]['totalofprodect']} :  ${widget.moduleMedicine.availableQuantity}',
                      sizetext: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            if ((amountoforder + 10) <
                                (widget.moduleMedicine.availableQuantity
                                    .toInt())) {
                              amountoforder += 10;
                              orderprodects[widget.Id]["amount"] =
                                  amountoforder;
                            }
                          });
                        },
                        child: thetext(
                          text: "10 + ",
                          sizetext: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (amountoforder <
                                (widget.moduleMedicine.availableQuantity
                                    .toInt())) {
                              amountoforder++;
                              orderprodects[widget.Id]["amount"] =
                                  amountoforder;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: coltext,
                          size: 40,
                        ),
                      ),
                      thetext(
                        text: "$amountoforder",
                        sizetext: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (amountoforder >= 1) {
                              amountoforder--;
                              orderprodects[widget.Id]["amount"] =
                                  amountoforder;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          color: coltext,
                          size: 40,
                        ),
                      ),
                      MaterialButton(
                          onPressed: () {
                            setState(() {
                              if ((amountoforder - 10) >= 0) {
                                amountoforder -= 10;
                                orderprodects[widget.Id]["amount"] =
                                    amountoforder;
                              }
                            });
                          },
                          child: thetext(
                            text: "10 - ",
                            sizetext: 15,
                          )),
                    ],
                  ),
                ),
                Divider(
                  color: coltext,
                  height: 2,
                  thickness: 2.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// orderprodects[widget.Id.toInt()]["amount"];