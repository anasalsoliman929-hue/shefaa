import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/View/pages/pages/menu.dart';
import 'package:shefaa/View/pages/widgets/item.dart';
import 'package:shefaa/controller/data/variable.dart';

late TextEditingController textcontroler = TextEditingController(text: '');

class search extends StatefulWidget {
  search({
    super.key,
  });

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String? qury = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colbgim,
      appBar: AppBar(
        backgroundColor: colbg,
        title: TextFormField(
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.name,
          controller: textcontroler,
          style: TextStyle(
            color: coltext,
          ),
          validator: (value) {
            return !GetUtils.isUsername(value!) ? 'not_valid_Username' : null;
          },
          decoration: InputDecoration(
            fillColor: colbgim,
            filled: true,
            hintText: 'enter name of midecin',
            suffixIcon: IconButton(
              splashColor: colbg,
              focusColor: colbg,
              hoverColor: colbg,
              highlightColor: colbg,
              onPressed: () {
                setState(() {
                  textcontroler.clear();
                  qury = '';
                });
              },
              icon: Icon(
                Icons.close,
                color: coltext,
              ),
            ),
            hintStyle: TextStyle(color: coltext),
            labelStyle: TextStyle(color: coltext),
          ),
          onTap: () {},
          onChanged: (value) {
            setState(() {
              qury = value!;
              print(value);
            });
          },
        ),
        iconTheme: IconThemeData(color: coltext),
        actionsIconTheme: IconThemeData(color: coltext),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 5, left: 5, top: 5),
        child: FutureBuilder<List<ModuleMedicine>>(
          future: qury != ''
              ? UeserLogin().getAllMedicinesSearchOfName(
                  name: qury!,
                )
              : UeserLogin().getAllMedicinesService(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');

              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              print('hasData');

              List<ModuleMedicine> Proudect = snapshot.data!;
              return ListView.builder(
                controller: menucontroler,
                itemCount: Proudect.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return item(
                    id: index.toString(),
                    moduleMedicine: Proudect[index],
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
        ),
      ),
    );
  }
}
