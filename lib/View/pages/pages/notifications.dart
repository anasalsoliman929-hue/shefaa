import 'package:flutter/material.dart';
import 'package:shefaa/View/pages/widgets/notificationpost.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/controller/data/variable.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colbg,
      appBar: AppBar(
        backgroundColor: colbg,
        title: thetext(
          text: 'notification',
          sizetext: 25,
        ),
        iconTheme: IconThemeData(color: coltext),
        actionsIconTheme: IconThemeData(color: coltext),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key("$index"),
                child: cardnotification(
                  titel: 'mm.',
                  subtitel: 'hjm',
                ),
              onDismissed: (direction) {
                
              },
              );
            },
          )),
    );
  }
}
