import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import 'package:plms_start/pages/utils/button_issue.dart';
// import 'package:plms_start/pages/utils/header_issue.dart';

// import 'screen_punch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'List_file.dart';
import 'list_Close.dart';
import 'list_Draft.dart';
import 'list_Open.dart';
import 'list_Req.dart';
import 'utils/popup_page.dart';

class ScreenList extends StatefulWidget {
  const ScreenList({Key? key}) : super(key: key);

  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  List data = Get.arguments;

  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2b3645),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.appTitle),
              IconButton(
                onPressed: () {
                  Get.toNamed('/popup');
                  // Get.to(PopUpPage(), opaque: false);
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          // initialIndex: 0,
          length: 5,
          child: Column(
            children: [
              Container(
                // height: Get.height,
                color: Color(0xFFE6E6E6),
                child: Container(
                  // height: Get.height,
                  // width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: TabBar(
                    controller: _tabController,
                    labelPadding: EdgeInsets.symmetric(horizontal: 5),
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },

                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 0.0001,
                    // isScrollable: true,

                    tabs: [
                      _tabBars(
                          0xff959595, AppLocalizations.of(context)!.tile1, 0),
                      _tabBars(
                          0xff7c4141, AppLocalizations.of(context)!.tile2, 1),
                      _tabBars(
                          0xffb88d6a, AppLocalizations.of(context)!.tile3, 2),
                      _tabBars(
                          0xff987ca1, AppLocalizations.of(context)!.tile4, 3),
                      _tabBars(
                          0xff637a8f, AppLocalizations.of(context)!.tile5, 4),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListFile(),
                    ListDraft(),
                    ListOpen(),
                    ListReq(),
                    ListClose(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: IssueButton(
            name: '/loading',
            name2: '/photoList',
            buttonname1: AppLocalizations.of(context)!.pListbutton1,
            buttonname2: AppLocalizations.of(context)!.pListbutton2));
  }

  Widget _tabBars(int colors, String tiles, int idx) {
    var radius = Radius.circular(8);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Get.height * 1 / 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: radius, topLeft: radius),
            color: Color(colors),
          ),
          width: MediaQuery.of(context).size.width * 1 / 5.5 * 1 / 2,
        ),
        Container(
          height: Get.height * 1 / 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: radius, topRight: radius, bottomRight: radius),
            boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(0, 1)),
            ],
            color: _currentIndex == idx ? Color(colors) : Colors.white,
          ),
          padding: EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width * 1 / 5,
          child: Tab(child: _colorChange(tiles, idx)),
        ),
      ],
    );
  }

  Widget _colorChange(String name, int idx) {
    return Text(
      name,
      style: TextStyle(
          color: _currentIndex == idx ? Colors.white : Colors.black,
          fontSize: 10),
    );
  }
}
