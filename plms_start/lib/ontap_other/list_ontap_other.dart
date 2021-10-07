import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

// import 'package:plms_start/pages/utils/button_issue.dart';
import 'package:plms_start/punch_issue/appbar_screen.dart';
import 'package:plms_start/punch_issue/tabbar_screen.dart';
import 'ontap_one_other.dart';
import 'ontap_three_other.dart';
import 'ontap_two_other.dart';

// import 'package:http/http.dart' as http;
import '../globals/login.dart' as login;
import '../globals/issue.dart' as issue;
import '../globals/punch_draft.dart' as draft;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/*
* name : PunchScreen
* description : PunchScreen page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class OnTapPage extends StatefulWidget {
  const OnTapPage({Key? key}) : super(key: key);

  @override
  _OnTapPageState createState() => _OnTapPageState();
}

class _OnTapPageState extends State<OnTapPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  // int _selectedIndex = 0;

  final page1Key = new GlobalKey();
  final page2Key = new GlobalKey();
  final page3Key = new GlobalKey();

  double page1Height = 0;
  double page2Height = 0;
  double page3Height = 0;
  bool isTapToScroll = false;

  List datas = Get.arguments[1];
  var idx = Get.arguments[0];

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScroll();
    });
    // draft.punch_issue_isTag = true;
    // draft.punch_issue_isBulk = false;
    // draft.punch_issue_Tag_Number = [];
    // draft.punch_issue_Bulk_Item = [];
    // draft.punch_issue_Category = [login.draftList[idx]['category']];
    // draft.punch_issue_System = [login.draftList[idx]['systemID']];
    // draft.punch_issue_Sub_System = [login.draftList[idx]['subsystem']];
    // draft.punch_issue_Unit = [];
    // draft.punch_issue_Area = [];
    // draft.punch_issue_Punch_ID = [];
    // draft.punch_issue_Description = [];

    // draft.punch_issue_Action_On = [login.draftList[idx]['department']];
    // draft.punch_issue_Discipline = [login.draftList[idx]['discipline']];
    // draft.punch_issue_Raised_On = [login.draftList[idx]['raisedBy']];
    // draft.punch_issue_Date = [];
    // draft.punch_issue_Keyword = [];
    // draft.punch_issue_Design = [];
    // draft.punch_issue_Material = [];

    // draft.punch_issue_Photo = [];
    // draft.punch_issue_Photo_Path = [];
    // draft.punch_issue_Photo_Name = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              // expandedHeight: 20,
              floating: true,
              // pinned: true,
              backgroundColor: Color(0xff2B3745),
              title: CatalogAppBar(
                title: 'Punch Issue',
              ),
            ),
            SliverAppBar(
              toolbarHeight: 90,
              // titleSpacing: 10,
              automaticallyImplyLeading: false,
              // expandedHeight: 50,
              elevation: 0,
              pinned: true,
              // titleSpacing: 0,
              backgroundColor: Color(0xFFE6E6E6),
              title:
                  // _tabbar(
                  //   _tabController,
                  //   _onTapToScroll,
                  // ),
                  CatalogTabBar(
                scrollController: _scrollController,
                tabController: _tabController,
                onTap: _onTapToScroll,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  OntapFirst(
                    key: page1Key,
                  ),
                  OntapSecond(
                    key: page2Key,
                  ),
                  OntapThird(
                    key: page3Key,
                  ),
                  // _bottonButton(),
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

  var api = dotenv.env['PHONE_IP'];

  // 스크롤 알고리즘
  void _onScroll() {
    if (isTapToScroll) return;

    if (page3Key.currentContext != null) {
      page3Height = page3Key.currentContext!.size!.height;
    } else {
      if (page1Key.currentContext != null) {
        page1Height = page1Key.currentContext!.size!.height;
      }
    }

    if (page2Key.currentContext != null) {
      page2Height = page2Key.currentContext!.size!.height;
    }

    if (_scrollController.offset <= page1Height) {
      _tabController.animateTo(0,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else if (_scrollController.offset > page1Height &&
        _scrollController.offset <= page1Height + page2Height) {
      _tabController.animateTo(1,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else if (_scrollController.offset > page1Height + page2Height &&
        _scrollController.offset <= page1Height + page2Height + page3Height) {
      _tabController.animateTo(2,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    }
  }

//탭 알고리즘
  void _onTapToScroll(int index) async {
    var keys = [page1Key, page2Key, page3Key];
    var previousIndex = _tabController.previousIndex;

    isTapToScroll = true;
    if (index == 0) {
      await _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    } else {
      if (previousIndex < index) {
        for (var i = previousIndex; i <= index; i++) {
          try {
            final RenderBox renderBox =
                keys[i].currentContext!.findRenderObject() as RenderBox;
            await _scrollController.position.ensureVisible(
              renderBox,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            );
          } catch (e) {}
        }
      } else {
        for (var i = previousIndex; i >= index; i--) {
          final RenderBox renderBox =
              keys[i].currentContext!.findRenderObject() as RenderBox;
          await _scrollController.position.ensureVisible(
            renderBox,
            // keys[i].currentContext!.findRenderObject(),
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      }
    }
    isTapToScroll = false;
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
                if (draft.punch_issue_Status.length == 0) {
                  draft.punch_issue_Status.add('1');
                } else {
                  draft.punch_issue_Status.removeAt(0);
                  draft.punch_issue_Status.add('1');
                }

                print('global!!!!!!!!!!!');
                print(draft.punch_issue_Status);
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
                if (draft.punch_issue_Status.length == 0) {
                  draft.punch_issue_Status.add('2');
                } else {
                  draft.punch_issue_Status.removeAt(0);
                  draft.punch_issue_Status.add('2');
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
