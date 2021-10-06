import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

// import 'package:plms_start/pages/utils/button_issue.dart';
import 'package:plms_start/punch_issue/appbar_screen.dart';
// import 'package:plms_start/punch_issue/first_screen.dart';
// import 'package:plms_start/punch_issue/second_screen.dart';
// import 'package:plms_start/punch_issue/tabbar_screen.dart';
// import 'package:plms_start/punch_issue/third_screen.dart';

// import 'package:http/http.dart' as http;
import 'package:plms_start/punch_main/ontap_one.dart';
import '../globals/globals.dart' as globals;
// import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'ontap_three.dart';
import 'ontap_two.dart';

/*
* name : PunchScreen
* description : PunchScreen page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class OntapPage extends StatefulWidget {
  const OntapPage({Key? key}) : super(key: key);

  @override
  _OntapPageState createState() => _OntapPageState();
}

class _OntapPageState extends State<OntapPage> with TickerProviderStateMixin {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              // expandedHeight: 20,
              floating: true,
              // pinned: true,
              backgroundColor: Color(0xff2B3745),
              // title: CatalogAppBar(),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  OntapOne(),
                  OntapTwo(),
                  OntapThree(),
                  _bottonButton(),
                  //todo 버튼 만들고, 이벤트 연결(put)
                  // Create post insert
                  // Read get select
                  // Update put update => 대상 id(where), 변경할 값들(set 구문)
                  // Delete delete delete
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bottonButton() {
    var buttonWidth = Get.width * 1 / 3.5;
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Color(0xff71838D), // background
                // onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Delete Draft"),
            ),
          ),
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Color(0xff5D8595), // background
                // onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                if (globals.punch_issue_Status.length == 0) {
                  globals.punch_issue_Status.add('1');
                } else {
                  globals.punch_issue_Status.removeAt(0);
                  globals.punch_issue_Status.add('1');
                }

                print('global!!!!!!!!!!!');
                print(globals.punch_issue_Status);
                Get.toNamed('/confirm');
              },
              child: Text("Save Draft"),
            ),
          ),
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Color(0xff2F4C5A), // background
                // onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                print('global!!!!!!!!!!!');
                if (globals.punch_issue_Status.length == 0) {
                  globals.punch_issue_Status.add('2');
                } else {
                  globals.punch_issue_Status.removeAt(0);
                  globals.punch_issue_Status.add('2');
                }
                Get.toNamed('/confirm');
              },
              child: Text("Create Issue"),
            ),
          ),
        ],
      ),
    );
  }
}
