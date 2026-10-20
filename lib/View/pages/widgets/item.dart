import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/like.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/widgets/image.dart';
import 'package:shefaa/View/pages/widgets/infoitem.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

List favorites = [];

class item extends StatefulWidget {
  item({
    super.key,
    required this.moduleMedicine,
    required this.id,
  });
  ModuleMedicine moduleMedicine;
  String id;
  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  bool isliked = false;
  @override
  void initState() {
    if (favorites.contains('${widget.moduleMedicine.id}')) {
      isliked = true;
    } else {
      isliked = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('http://$host1:8000' + '${widget.moduleMedicine.image_url}');
    return Directionality(
      textDirection: theTextDecoration,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: InkWell(
          child: Card(
            color: colbg,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                    trailing: IconButton(
                      onPressed: () async {
                        if (isliked) {
                          print(isliked);
                          favorites.remove('${widget.moduleMedicine.id}');
                          await Like().addLike(IdLike:  widget.moduleMedicine.id.toString(),);
                          // await Like().deleteLike(
                          //     IdLikedelete: widget.moduleMedicine.id.toString());

                          setState(() {
                            isliked = !isliked;
                          });
                        } else {
                          favorites.add('${widget.moduleMedicine.id}');
                                                    await Like().addLike(IdLike:  widget.moduleMedicine.id.toString(),);

                          /////////////////////////////////////////////////////
                        // await Like().deleteLike(
                          //     IdLikedelete: widget.moduleMedicine.id.toString());


                          setState(() {
                            isliked = !isliked;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: isliked ? Colors.red : coltext,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: image(
                      theimage: 'assets/p${widget.id}.jpg',
                    ),
                  ),
                  // Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Image.network(
                  //       'http://$host1:8000${widget.moduleMedicine.image_url}',
                  //       fit: BoxFit.fill,
                  //     )),
                  ListTile(
                    title: thetext(
                        text: widget.moduleMedicine.price + "  \$",
                        sizetext: 20),
                    titleAlignment: ListTileTitleAlignment.center,
                    subtitle: thetext(
                      text: widget.moduleMedicine.category,
                      sizetext: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Get.to(
              infoitem(
                iditem: widget.moduleMedicine.id,
                moduleMedicine: widget.moduleMedicine,
              ),
            );
          },
        ),
      ),
    );
  }
}
