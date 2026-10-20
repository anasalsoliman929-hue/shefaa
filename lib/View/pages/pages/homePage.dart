import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shefaa/Model/apicatigory.dart';
import 'package:shefaa/View/pages/pages/splashscren.dart';
import 'package:shefaa/View/pages/pages/catigory.dart';
import 'package:shefaa/View/pages/pages/favorite.dart';
import 'package:shefaa/View/pages/pages/myorders.dart';
import 'package:shefaa/View/pages/pages/purchases.dart';
import 'package:shefaa/View/pages/pages/menu.dart';
import 'package:shefaa/View/pages/pages/notifications.dart';
import 'package:shefaa/View/pages/pages/profile.dart';
import 'package:shefaa/View/pages/pages/search.dart';
import 'package:shefaa/View/pages/widgets/text.dart';
import 'package:shefaa/View/pages/pages/setting.dart';
import 'package:shefaa/controller/data/langugus.dart';
import 'package:shefaa/controller/data/variable.dart';

late TabController maintapcontroler;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  @override
  void initState() {
    maintapcontroler = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: theTextDecoration,
      child: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: colbgim,
            appBar: AppBar(
              toolbarHeight: 45,
              backgroundColor: colbg,
              actionsIconTheme: IconThemeData(color: coltext),
              iconTheme: IconThemeData(color: coltext),
              leading: IconButton(
                icon: Icon(
                  Icons.search,
                  color: coltext,
                  size: 20,
                ),
                onPressed: () {
                  Get.to(search());
                },
              ),
              title: thetext(
                  text: langugus[indexlang]['shefaamedicines'], sizetext: 25),
              centerTitle: true,
              bottom: TabBar(
                automaticIndicatorColorAdjustment: true,
                labelColor: Colors.blue,
                unselectedLabelColor: coltext,
                controller: maintapcontroler,
                isScrollable: true,
                indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                splashFactory: NoSplash.splashFactory,
                splashBorderRadius: BorderRadius.circular(20),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return states.contains(MaterialState.focused)
                        ? null
                        : const Color.fromARGB(139, 12, 56, 198);
                  },
                ),
                onTap: (value) {},
                tabs: [
                  Tab(
                    child: thetext(
                      text: langugus[indexlang]['medicines'],
                      sizetext: 15,
                    ),
                  ),
                  Tab(
                    child: thetext(
                      text: langugus[indexlang]['favorites'],
                      sizetext: 15,
                    ),
                  ),
                  Tab(
                    child: thetext(
                      text: langugus[indexlang]['categories'],
                      sizetext: 15,
                    ),
                  ),
                  Tab(
                    child: thetext(
                      text: langugus[indexlang]['myorders'],
                      sizetext: 15,
                    ),
                  ),
                  Tab(
                    child: thetext(
                      text: langugus[indexlang]['settings'],
                      sizetext: 15,
                    ),
                  ),
                  // Tab(
                  //   child: thetext(
                  //     text: langugus[indexlang]['profile'],
                  //     sizetext: 15,
                  //   ),
                  // ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(const notifications());
                  },
                  icon: const Icon(
                    Icons.notifications,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(
                      mashtraeat(),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 25,
                  ),
                ),
              ],
            ),
            body: TabBarView(
              controller: maintapcontroler,
              dragStartBehavior: DragStartBehavior.down,
              viewportFraction: 1.0,
              children: const [
                menu(),
                favorite(),
                catigory(),
                myorder(),
                setting(),
                // profile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
