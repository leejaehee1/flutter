import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/utils/button_issue.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

import 'screenTabbar.dart';

// import 'screen_punch.dart';

class ScreenList extends StatefulWidget {
  ScreenList({Key? key}) : super(key: key);

  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> with TickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    // _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   _onScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff2B3745),
      //   title: Text('Title'),
      // ),
      backgroundColor: Color(0xFFE6E6E6),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            ScreenTabBar(
              tabController: _tabController,
            ),
            IssueButton(
              name: '/punchList',
              buttonname1: 'Add Punch Issue',
              buttonname2: 'Upload Photos',
            ),
          ],
        ),
      ),
    );
  }
}
